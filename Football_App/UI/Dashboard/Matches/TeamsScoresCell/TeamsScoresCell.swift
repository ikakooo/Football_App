//
//  TeamsScoresCell.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/2/23.
//

import UIKit
import Kingfisher

class TeamsScoresCell: UITableViewCell {

    @IBOutlet weak var scoresLabel: UILabel!
    @IBOutlet weak var matchTimeLabel: UILabel!
    @IBOutlet weak var team1Name: UILabel!
    @IBOutlet weak var team2Name: UILabel!
    
    @IBOutlet weak var team1Image: UIImageView!
    @IBOutlet weak var team2Image: UIImageView!
    
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

extension TeamsScoresCell: ConfigurableCell {
    
    func configure(with model: CellModel) {
        guard let model = model as? ViewModel else { return }
        scoresLabel.text = "\(model.data?.match?.team1?.score ?? 0) : \(model.data?.match?.team2?.score ?? 0)"
        matchTimeLabel.text = "\(Int(model.data?.match?.matchTime ?? 0))’"
        team1Name.text = model.data?.match?.team1?.teamName
        team2Name.text = model.data?.match?.team2?.teamName
        
        team1Image.kf.setImage(
            with: URL(string: model.data?.match?.team1?.teamImage ?? ""),
            placeholder: nil,
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
        
        team2Image.kf.setImage(
            with: URL(string: model.data?.match?.team2?.teamImage ?? ""),
            placeholder: nil,
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


extension TeamsScoresCell {
    
    struct ViewModel: CellModel {
        var cellIdentifier: String {
            return String(describing: TeamsScoresCell.self)
        }
        
        var data: ResponceMatchModel?
    }
}
