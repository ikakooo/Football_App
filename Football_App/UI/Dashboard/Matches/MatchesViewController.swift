//
//  MatchesViewController.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/1/23.
//

import Resolver
import Combine
import UIKit


class MatchesViewController: UIViewController {
    
    //MARK: - Outlets

    @IBOutlet weak var tableViewBorderView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Variables
    
    @Injected private var viewModel: MatchesViewModel
    @Injected private var router: MatchesRouter
    
    private var subscriptions = Set<AnyCancellable>()
    
    private lazy var dataSource = MatchesViewDataSource(tableView: tableView )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewBorderView.dropShadow(scale: true)

        bindData()
        bindRouter()
        viewModel.viewDidLoad()
    }

}


//MARK: - Bind
extension MatchesViewController {
    
    private func bindData() {
        viewModel.getListForTableView()
            .sink { [weak self] data in
                guard let self else { return }
                self.reloadData(with: data )
            }
            .store(in: &subscriptions)
    }
    
    
    private func bindRouter() {
        viewModel.getRouter()
            .compactMap { $0 }
            .sink { [weak self] route in
                guard let self else { return }
                self.router.route(to: route, from: self)
            }.store(in: &subscriptions)
    }
}

//MARK: - Setup
extension MatchesViewController {
    
    func reloadData(with rows: [SectionModel]){
        dataSource.reload(with: rows)
    }
}
