//
//  ContentTypeSegmenControlCell.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/2/23.
//

import UIKit

class ContentTypeSegmenControlCell: UITableViewCell {

    @IBOutlet weak var segmentControlView: UIView!
    var segmentControl: InfoSegmenControl = InfoSegmenControl(frame: .init(x: 0, y: 0, width: 200, height: 35))
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
        segmentControl.commaSeparatedButtonTitle = "Overview,Statistic,Line up"
        segmentControl.textColor = UIColor(named: "TextColorOne") ?? .label
        segmentControl.selectorColor = UIColor(named: "AccentColor") ?? .label
        segmentControl.selectorTextColor = UIColor(named: "AccentColor") ?? .label
        segmentControlView.addSubview(segmentControl)
        segmentControl.fixInView(segmentControlView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension ContentTypeSegmenControlCell: ConfigurableCell {
    
    func configure(with model: CellModel) {
        guard let model = model as? ViewModel else { return }
        
        
   
    }
}


extension ContentTypeSegmenControlCell {
    
    struct ViewModel: CellModel {
        var cellIdentifier: String { String(describing: ContentTypeSegmenControlCell.self) }
        
        var data: MatchModel?
    }
}
