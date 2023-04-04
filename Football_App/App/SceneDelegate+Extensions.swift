//
//  SceneDelegate+Extensions.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/4/23.
//

import UIKit

var bottomSafeAreaHight: CGFloat = 0
var topSafeAreaHight: CGFloat = 0

extension SceneDelegate {
    
    
    func showBlurEffect(){
        
        var blurEffect = UIBlurEffect(style: .dark)
        
        if UITraitCollection.current.userInterfaceStyle == .light {
            blurEffect = UIBlurEffect(style: .light)
        }
        
        blurVisualEffectView = UIVisualEffectView(effect: blurEffect)
        
        if let blurVisualEffectView {
            blurVisualEffectView.frame = window!.bounds
            
            window?.addSubview(blurVisualEffectView)
        }
    }
    
    func hideBlurEffect(){
        blurVisualEffectView?.removeFromSuperview()
    }
}
