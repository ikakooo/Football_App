//
//  MatchesServices.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/1/23.
//

import Foundation
import Combine
import Resolver

class MatchesServices {
    
    @Injected private var session: URLSession
    
    private var subscriptions = Set<AnyCancellable>()
    
    
    func getMatchInfo() -> AnyPublisher<ResponceMatchModel?, Never>{
        guard let request = RequestURLGenerator(
            httpMethod: .get,
            baseUrl: restBaseUrl,
            path: path
        ).requestURL() else { return Just(nil).eraseToAnyPublisher()}
        
     return session.dataTaskPublisher(for: request)
            .tryMap{$0.data}
            .decode(type: ResponceMatchModel?.self, decoder: JSONDecoder())
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }
    
    
}
