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

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }
    
}


extension ActionCell: ConfigurableCell {
    
    func configure(with model: CellModel) {
        guard let model = model as? ViewModel else { return }
        
        model.summarie?.team1Action?.forEach { action in
            switch action.actionType {
                
            case .GOAL, .YELLOW_CARD, .RED_CARD:
                let goalView = GoalOrCardLeftView(frame: .zero)
                goalView.configure(action: action, actionTime: model.summarie?.actionTime)
                
                goalView.fixInView(teamLeft)
                
            case .SUBSTITUTION:
                break
                
            default: break
            }
        }
        
        model.summarie?.team2Action?.forEach { action in

            
            switch action.actionType {
                
            case .GOAL, .YELLOW_CARD, .RED_CARD:
                let goalView = GoalOrCardRightView(frame: .zero)
                goalView.configure(action: action, actionTime: model.summarie?.actionTime)
                
                goalView.fixInView(teamRight)
                
            case .SUBSTITUTION:
                break
                
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
