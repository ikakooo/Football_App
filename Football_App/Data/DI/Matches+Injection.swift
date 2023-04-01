//
//  Matches+Injection.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/1/23.
//

import Resolver

extension Resolver {
    
    static func registerMatches(){
        
        register {
            MatchesViewModel()
        }
        
        register {
            MatchesRouter()
        }
        
        register {
            MatchesServices()
        }
    }
    
}
