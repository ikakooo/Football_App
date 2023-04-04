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
        getMatchInfo()
    }
    
    private func getMatchInfo(){
        sectionsList.removeAll()
        matchesServices.getMatchInfo()
            .receive(on: DispatchQueue.main)
            .sink(receiveValue: { [weak self] data in
                
                if let model = self?.matchInfoSection(data: data),
                   let actionsModel = self?.matchActionsByTimeLineSection(data: data)
                {
                    self?.sectionsList.append(contentsOf: [model, actionsModel])
                }
                
               
            })
            .store(in: &subscriptions)
    }
    
    //MARK: - ViewModels
    private func matchInfoSection(data: ResponceMatchModel?)-> SectionModel{
        SectionModel(
            headerModel: nil,
            cellModels:[MatcheDayCell.ViewModel(data: data),
                        TeamsScoresCell.ViewModel(data: data),
                        ContentTypeSegmenControlCell.ViewModel(data: data),
                        BallPossessionCell.ViewModel(data: data)
                       ]
        )
    }

    private func matchActionsByTimeLineSection(data: ResponceMatchModel?)-> SectionModel{
      let actionModels  =  data?.match?.matchSummary?.summaries?.compactMap { summarie in
            ActionCell.ViewModel(summarie: summarie)
    
        }
        
        return   SectionModel(
            headerModel: TimeHeaderCell.ViewModel(),
            cellModels: actionModels ?? [])
    }
    
    
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

