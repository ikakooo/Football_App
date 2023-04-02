//
//  InfoSegmenControl.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/2/23.
//

import UIKit
import Combine

class InfoSegmenControl: UIControl {
    
    var borderBacground: UIView!
    var buttons = [UIButton]()
    var selector : UIView!
    @Published private var selectedSegmentIndex = 0
    
    @IBInspectable
    var borderWidthTo: CGFloat = 0 {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable
    var borderColorTo : UIColor = UIColor.clear {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var commaSeparatedButtonTitle: String = "" {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable
    var textColor : UIColor = .gray{
        didSet{
            updateView()
        }
    }
    
    @IBInspectable
    var selectorColor : UIColor = .gray{
        didSet{
            updateView()
        }
    }
    
    @IBInspectable
    var selectorTextColor : UIColor = .white {
        didSet{
            updateView()
        }
    }
    
    func updateView() {
        buttons.removeAll()
        subviews.forEach {
            $0.removeFromSuperview()
        }
        
        let buttonTitles = commaSeparatedButtonTitle.components(separatedBy: ",")
        
        for buttonTitle in buttonTitles{
            let button = UIButton(type: .system)
            button.titleLabel?.textAlignment = .center
            button.titleLabel?.numberOfLines = 0
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
            button.setTitle(buttonTitle, for: .normal)
            button.setTitleColor(textColor, for: .normal)
            button.addTarget(self, action:#selector(buttonTapped(button:)) ,for: .touchUpInside)
            buttons.append(button)
        }
        
        borderBacground = UIView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        borderBacground.layer.borderWidth = borderWidthTo
        borderBacground.layer.borderColor = borderColorTo.cgColor
        borderBacground.layer.cornerRadius = 6.0
        addSubview(borderBacground)
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        addSubview(stackView)
        
        buttons[0].setTitleColor(selectorTextColor, for: .normal)
        let selectorWidth = frame.width / CGFloat(buttonTitles.count)
        selector = UIView(frame: CGRect(x: 0, y: 0, width: selectorWidth, height: frame.height))
        selector.backgroundColor = UIColor.clear
        selector.layer.borderWidth = 1.0
        selector.layer.cornerRadius = 6.0
        selector.layer.borderColor = UIColor.clear.cgColor
        selector.layer.masksToBounds = true
        addSubview(selector)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        borderBacground.translatesAutoresizingMaskIntoConstraints = false
        borderBacground.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        borderBacground.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        borderBacground.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        borderBacground.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if selectedSegmentIndex == 0 { updateView() }
        borderBacground?.layer.borderColor = borderColorTo.cgColor
    }

    
    @objc func buttonTapped(button : UIButton) {
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            
            if btn == button {
                selectedSegmentIndex = buttonIndex
                let selectorStartPosition = frame.width / CGFloat(buttons.count) * CGFloat(buttonIndex)
                UIView.animate(withDuration: 0.3, animations: {
                    self.selector.frame.origin.x = selectorStartPosition
                })
                btn.setTitleColor(selectorTextColor, for: .normal)
                
            }
        }
        sendActions(for: .valueChanged)
    }
    
    public func setSegment(index: Int ) {
        for (buttonIndex, btn) in buttons.enumerated() {
            btn.setTitleColor(textColor, for: .normal)
            
            if btn == buttons[index] {
                selectedSegmentIndex = buttonIndex
                let selectorStartPosition = frame.width / CGFloat(buttons.count) * CGFloat(buttonIndex)
                UIView.animate(withDuration: 0.3, animations: {
                  //  self.selectorView.leftConstraint?.constant = selectorPosition
                    self.selector.frame.origin.x = selectorStartPosition
                })
                btn.setTitleColor(selectorTextColor, for: .normal)
                
            }
        }
    }
    
    public func didChangeSelectedSegmentIndex()-> AnyPublisher<Int, Never> {
        $selectedSegmentIndex.eraseToAnyPublisher()
    }
}

