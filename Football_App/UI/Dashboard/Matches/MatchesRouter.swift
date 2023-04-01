//
//  MatchesRouter.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/1/23.
//

import UIKit

class MatchesRouter {
    func route(to route: MatchesRoute, from context: UIViewController ) {
        switch route {
        case .player:
            let controller = UIViewController()
            context.show(controller, sender: self)
        }
    }
}
