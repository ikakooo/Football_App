//
//  Application+Injection.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/1/23.
//

import Resolver
import Combine
import Foundation

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        registerApplicationServices()
    }
    
    private static func registerApplicationServices(){
        registerScenes()
        registerNetworkServices()
    }
    
    private static func registerScenes(){
        registerMatches()
    }
    
    
    private static func registerNetworkServices(){
        register {
            
        }
        
        register {
            createURLSession()
        }
    }
    
    
    private static func createURLSession()-> URLSession {
        URLSession(configuration: .default)
    }
}
