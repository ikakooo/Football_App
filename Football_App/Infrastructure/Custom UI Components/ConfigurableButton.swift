//
//  ConfigurableButton.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/1/23.
//

import UIKit

@IBDesignable
class ConfigurableButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            setNeedsDisplay()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
            setNeedsDisplay()
        }
    }

    
    @IBInspectable
    var borderColor : UIColor = UIColor.clear {
        didSet {
            layer.borderColor = borderColor.cgColor
            setNeedsDisplay()
        }
    }
    
}

