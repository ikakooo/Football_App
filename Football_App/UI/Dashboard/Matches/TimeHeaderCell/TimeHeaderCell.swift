//
//  TimeHeaderCell.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/2/23.
//

import UIKit

class TimeHeaderCell: UITableViewCell {
    @IBOutlet weak var timeHeaderLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TimeHeaderCell: ConfigurableCell {
    
    func configure(with model: CellModel) {
        guard let model = model as? ViewModel else { return }
        
        // timeHeaderLabel.text = "At \(model.actionTime ?? "0") Minutes"
    }
}


extension TimeHeaderCell {
    
    struct ViewModel: CellModel {
        var cellIdentifier: String { String(describing: TimeHeaderCell.self) }
        
        var actionTime: String?
    }
}
