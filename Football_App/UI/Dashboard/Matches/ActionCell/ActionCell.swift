//
//  ActionCell.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/2/23.
//

import UIKit

class ActionCell: UITableViewCell {
    @IBOutlet weak var teamLeft: UIView!
    @IBOutlet weak var teamRight: UIView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        teamLeft = nil
        teamRight = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }
    
}


extension ActionCell: ConfigurableCell {
    
    func configure(with model: CellModel) {
        guard let model = model as? ViewModel else { return }
        
       if let action = model.summarie?.team1Action?.first {
            switch action.actionType {
                
            case .GOAL, .YELLOW_CARD, .RED_CARD:
                let goalView = GoalOrCardLeftView(frame: .zero)
                goalView.configure(action: action, actionTime: model.summarie?.actionTime)
                
                goalView.fixInView(teamLeft)
                
            case .SUBSTITUTION:
                let substitutionView = SubstitutionLeftView(frame: .zero)
                substitutionView.configure(action: action, actionTime: model.summarie?.actionTime)
                
                substitutionView.fixInView(teamLeft)
                
            default: break
            }
        }
        
        if let action =  model.summarie?.team2Action?.first {
            
            switch action.actionType {
                
            case .GOAL, .YELLOW_CARD, .RED_CARD:
                let goalView = GoalOrCardRightView(frame: .zero)
                goalView.configure(action: action, actionTime: model.summarie?.actionTime)
                
                goalView.fixInView(teamRight)
                
            case .SUBSTITUTION:
                
                let substitutionView = SubstitutionRightView(frame: .zero)
                substitutionView.configure(action: action, actionTime: model.summarie?.actionTime)
                
                substitutionView.fixInView(teamRight)
                
            default: break
            }
        }
        
    }
}


extension ActionCell {
    
    struct ViewModel: CellModel {
        var cellIdentifier: String { String(describing: ActionCell.self) }
        
        var summarie: SummaryModel?
    }
}
