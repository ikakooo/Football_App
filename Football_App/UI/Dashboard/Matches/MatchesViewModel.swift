//
//  MatchesViewModel.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/1/23.
//

import Combine
import Resolver
import Foundation

enum MatchesRoute {
    case player
}

class MatchesViewModel {
    
    @Injected private var matchesServices: MatchesServices
    
    private var subscriptions = Set<AnyCancellable>()
    
    
    @Published private var sectionsList: [SectionModel] = []
    @Published private var router: MatchesRoute?
    
    func viewDidLoad(){
        addSections()
    }
    
    func addSections(){
         sectionsList = [ matchInfoSection ]
    }
    
    private func getMatchInfo(){
        matchesServices.getMatchInfo()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { value in
                
                print(value)
               
            })
            .store(in: &subscriptions)
    }
    

    private var matchInfoSection: SectionModel {
        SectionModel(
            headerModel: nil,
            cellModels:[MatcheDayCell.ViewModel(), MatcheDayCell.ViewModel(),MatcheDayCell.ViewModel()]
        )
    }
    
    //MARK: - ViewModels
    

    
    
    //MARK: - Route To

    func openPlayer(){
        router = .player
    }
    
    //MARK: - Set up Publishers
    
    public func getListForTableView() -> AnyPublisher<[SectionModel], Never> {
        $sectionsList.eraseToAnyPublisher()
    }
    

    func getRouter() -> AnyPublisher<MatchesRoute?, Never> {
        $router.eraseToAnyPublisher()
    }
}

