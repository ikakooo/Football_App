//
//  MainDashboardTabBarController.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/1/23.
//

import UIKit

class MainDashboardTabBarController: UITabBarController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = .black
        tabBar.barTintColor = .purple
        tabBar.isTranslucent = false
        //tabBar.tintColor = .green
        tabBar.unselectedItemTintColor = .blue
        
        let vc1 = MatchesViewController()
        vc1.view.backgroundColor = UIColor.green
        vc1.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)

        let vc2 = UIViewController()
        vc2.view.backgroundColor = UIColor.blue
        vc2.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        
        let vc3 = UIViewController()
        vc3.view.backgroundColor = UIColor.gray
        vc3.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)

        viewControllers = [vc1, vc2, vc3]
    }
    
}
