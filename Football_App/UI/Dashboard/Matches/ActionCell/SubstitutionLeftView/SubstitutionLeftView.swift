//
//  SubstitutionLeftView.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/2/23.
//

import UIKit
import Kingfisher

class SubstitutionLeftView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var teamPlayerOneImage: UIImageView!
    @IBOutlet weak var teamPlayerTwoImage: UIImageView!
    @IBOutlet weak var teamPlayerActionTitleLabel: UILabel!
    @IBOutlet weak var teamPlayerOneNameLabel: UILabel!
    @IBOutlet weak var teamPlayerTwoNameLabel: UILabel!
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("SubstitutionLeftView", owner: self, options: nil)
        contentView.fixInView(self)
    }
    
    
    func configure(action: TeamActionModel, actionTime: String?){
        teamPlayerActionTitleLabel.text = "\(actionTime ?? "0")' Substitution"
        
        teamPlayerOneNameLabel.text = action.action?.player1?.playerName
        teamPlayerTwoNameLabel.text = action.action?.player2?.playerName
        
    }
    
}
