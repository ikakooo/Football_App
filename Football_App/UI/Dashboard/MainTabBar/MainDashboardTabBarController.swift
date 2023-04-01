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
        setUpNavigationBar()
        
        tabBar.backgroundColor = UIColor(named: "AccentColor")
        tabBar.barTintColor = .purple
        tabBar.isTranslucent = false
        //tabBar.tintColor = .green
        tabBar.unselectedItemTintColor = UIColor(named: "TabButtonsUnselectedColor")
        
        
        
        let vc1 = MatchesViewController()
        vc1.tabBarItem = UITabBarItem(title: "Matches", image: UIImage(named: "Matches"), tag: 0)
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = UIColor.blue
        vc2.tabBarItem = UITabBarItem(title: "Top Players", image: UIImage(named: "TopPlayers"), tag: 1)
        
        let vc3 = UIViewController()
        vc3.view.backgroundColor = UIColor.gray
        vc3.tabBarItem = UITabBarItem(title: "Videos", image: UIImage(named: "Viedos"), tag: 2)
        
        
        let vc4 = UIViewController()
        vc4.view.backgroundColor = UIColor.red
        let favItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 3)
        favItem.badgeValue = "3"
        vc4.tabBarItem = favItem
        
        
        let vc5 = UIViewController()
        vc5.view.backgroundColor = UIColor.red
        vc5.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(systemName: "gearshape.fill"), tag: 4)
        
        viewControllers = [vc1, vc2, vc3, vc4, vc5]
    }
    
    
    private func setUpNavigationBar(){
        navigationItem.title = "Match Preview"
        
        
        let button = UIButton()
        button.frame = CGRect(x: 0, y: 0, width: 20, height: 21)
        button.setImage(UIImage(named: "bell"), for: .normal)
        button.addTarget(self, action: #selector(addTapped), for: .touchUpInside)
        
        let barButton = UIBarButtonItem()
        barButton.customView = button
        navigationItem.rightBarButtonItem = barButton
    }
    
    
    @objc func addTapped(){
        
    }
    
    
}
