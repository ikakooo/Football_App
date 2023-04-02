//
//  BallPossessionCell.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/2/23.
//

import UIKit

class BallPossessionCell: UITableViewCell {

    @IBOutlet weak var firsTeamPercentageLabel: UILabel!
    @IBOutlet weak var secondTeamPercentageLabel: UILabel!
    @IBOutlet weak var progressbarView: HorizontalProgressBar!
    
    
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
        
        let ballPositionTeam1 = CGFloat(model.data?.match?.team1?.ballPosition ?? 0)
        let ballPositionTeam2 = CGFloat(model.data?.match?.team2?.ballPosition ?? 0)
        
        firsTeamPercentageLabel.text = "\(ballPositionTeam1)%"
        secondTeamPercentageLabel.text = "\(ballPositionTeam2)%"
        progressbarView.progress = ballPositionTeam1 / 100
    }
}


extension BallPossessionCell {
    
    struct ViewModel: CellModel {
        var cellIdentifier: String { String(describing: BallPossessionCell.self) }
        
        var data: MatchModel?
    }
}
