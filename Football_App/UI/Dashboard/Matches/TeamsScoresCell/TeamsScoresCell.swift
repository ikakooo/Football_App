//
//  TeamsScoresCell.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/2/23.
//

import UIKit

class TeamsScoresCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TeamsScoresCell: ConfigurableCell {
    
    func configure(with model: CellModel) {
        guard let model = model as? ViewModel else { return }
        
    }
}


extension TeamsScoresCell {
    
    struct ViewModel: CellModel {
        var cellIdentifier: String {
            return String(describing: TeamsScoresCell.self)
        }
        
        
    }
}
