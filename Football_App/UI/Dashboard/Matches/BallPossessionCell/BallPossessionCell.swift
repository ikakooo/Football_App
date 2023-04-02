//
//  BallPossessionCell.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/2/23.
//

import UIKit

class BallPossessionCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension BallPossessionCell: ConfigurableCell {
    
    func configure(with model: CellModel) {
        guard let model = model as? ViewModel else { return }
        
        
    }
}


extension BallPossessionCell {
    
    struct ViewModel: CellModel {
        var cellIdentifier: String { String(describing: BallPossessionCell.self) }
        
        var data: MatchModel?
    }
}
