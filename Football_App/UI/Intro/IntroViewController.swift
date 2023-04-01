//
//  IntroViewController.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/1/23.
//

import UIKit

class IntroViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func onTapOpenDashboardButton(_ sender: Any) {
        show(MainDashboardTabBarController(), sender: self)
    }
}
