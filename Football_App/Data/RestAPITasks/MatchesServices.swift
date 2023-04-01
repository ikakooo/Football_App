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
    
    
    func getMatchInfo() -> AnyPublisher<MatchModel?, Never>{
        guard let request = RequestURLGenerator(
            httpMethod: .get,
            baseUrl: restBaseUrl,
            path: path
        ).requestURL() else { return Just(nil).eraseToAnyPublisher()}
        
     return session.dataTaskPublisher(for: request)
            .tryMap{ (data, response) in
                var decoded = try? JSONDecoder().decode(MatchModel?.self, from: data )
                decoded?.httpStatusCode = (response as? HTTPURLResponse)?.statusCode
                
               return decoded
            }
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }
    
    
}
