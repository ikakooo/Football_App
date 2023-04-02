//
//  MatchesViewDataSource.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/1/23.
//

import UIKit

class MatchesViewDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    weak private var tableView: UITableView!
    
    private var listDataSource = [SectionModel]()
    
    init(tableView: UITableView!) {
        super.init()
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.showsHorizontalScrollIndicator = false
        self.tableView.separatorColor = .clear
        self.tableView.sectionHeaderTopPadding = 0

        self.tableView.registerNib(class: MatcheDayCell.self)
        self.tableView.registerNib(class: TeamsScoresCell.self)
        self.tableView.registerNib(class: ContentTypeSegmenControlCell.self)
        self.tableView.registerNib(class: BallPossessionCell.self)
        self.tableView.registerNib(class: TimeHeaderCell.self)

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listDataSource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listDataSource[section].cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = listDataSource[indexPath.section].cellModels[indexPath.row].cellIdentifier
        let dequeued = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        let cell = dequeued as! ConfigurableCell
        cell.configure(from: listDataSource, for: indexPath)
        return dequeued
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 20
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let identifier = listDataSource[section].headerModel?.cellIdentifier,
              let headerModel = listDataSource[section].headerModel else { return nil }
        
        let dequeued = tableView.dequeueReusableCell(withIdentifier: identifier)
        let cell = dequeued as! ConfigurableCell
        cell.configure(with: headerModel)
        return dequeued
    }
    
    func reload(with data: [SectionModel]){
        self.listDataSource = data
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    
}
