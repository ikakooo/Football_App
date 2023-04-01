//
//  CellConfiguration.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/1/23.
//

import Foundation

protocol CellModel {
    var cellIdentifier: String { get }
}

protocol ConfigurableCell {
    func configure(with model: CellModel)
    func configure(from listDataSource: [SectionModel], for indexPath: IndexPath)
}

extension ConfigurableCell {
    func configure(from listDataSource: [SectionModel], for indexPath: IndexPath){
        configure(with: listDataSource[indexPath.section].cellModels[indexPath.row])
    }
}

struct SectionModel {
    let headerModel: CellModel?
    let cellModels: [CellModel]
}
