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
        
        
    }
    
}
