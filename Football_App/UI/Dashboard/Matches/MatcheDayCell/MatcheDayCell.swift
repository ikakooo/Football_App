//
//  MatcheDayCell.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/2/23.
//

import UIKit

class MatcheDayCell: UITableViewCell {
    
    @IBOutlet weak var matchDateLabel: UILabel!
    @IBOutlet weak var stadiumAdressLabel: UILabel!
    
    
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

extension MatcheDayCell: ConfigurableCell {
    
    func configure(with model: CellModel) {
        guard let model = model as? ViewModel else { return }
        
        
        let dateVar = Date(milliseconds: (model.data?.match?.matchDate ?? 0))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MMMM-yyyy"
        print(dateFormatter.string(from: dateVar))
        
        
        
        
        matchDateLabel.text = dateFormatter.string(from: dateVar)
        stadiumAdressLabel.text = model.data?.match?.stadiumAdress
    }
}


extension MatcheDayCell {
    
    struct ViewModel: CellModel {
        var cellIdentifier: String { String(describing: MatcheDayCell.self) }
        
        var data: ResponceMatchModel?
    }
}
