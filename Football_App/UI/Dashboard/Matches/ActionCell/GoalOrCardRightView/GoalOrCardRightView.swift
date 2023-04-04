//
//  GoalOrCardRightView.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/2/23.
//

import UIKit
import Kingfisher

class GoalOrCardRightView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var teamPlayerImage: UIImageView!
    @IBOutlet weak var teamPlayerActionImage: UIImageView!
    @IBOutlet weak var teamPlayerActionTitleLabel: UILabel!
    @IBOutlet weak var teamPlayerNameLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("GoalOrCardRightView", owner: self, options: nil)
        contentView.fixInView(self)
    }
    
    func configure(action: TeamActionModel, actionTime: String?){
        
        teamPlayerNameLabel.text = action.action?.player?.playerName
        
        switch action.actionType {
        case .GOAL:
            teamPlayerActionTitleLabel.text = "\(actionTime ?? "0")' Goals by"
            teamPlayerActionImage.image = UIImage(named: "GreenBall")
            
        case .YELLOW_CARD:
            teamPlayerActionTitleLabel.text = "\(actionTime ?? "0")' Tripping"
            teamPlayerActionImage.image = UIImage(named: "YELLOWCARD")
        case .RED_CARD:
            teamPlayerActionTitleLabel.textColor = .red
            teamPlayerActionTitleLabel.text = "\(actionTime ?? "0")' Own Goal"
            teamPlayerActionImage.image = UIImage(named: "RedBall")
        default: break
            
        }
        
        teamPlayerImage.kf.setImage(
            with: URL(string: action.action?.player?.playerImage ?? ""),
            placeholder: UIImage(named: "Messi"),
            options: [
                .loadDiskFileSynchronously,
                .cacheOriginalImage,
                .transition(.fade(0.25))
            ],
            progressBlock: { receivedSize, totalSize in
                // Progress updated
            },
            completionHandler: { result in
                // Done
            }
        )
        
        
    }
}
