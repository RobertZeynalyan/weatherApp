//
//  Data.swift
//  weatherApp
//
//  Created by Robert on 19.11.23.
//

import Foundation

class CollData {
    
    var dataCollectionView: [CollectionViewDemoModel] = []
    var dataTableView: [ForTenDaysCellModel] = []
    
    init() {
        getData()
    }  
    
    private func getData() {
        dataCollectionView.append(CollectionViewDemoModel(time: "1PM", celsius: "14°C"))
        dataCollectionView.append(CollectionViewDemoModel(time: "2PM", celsius: "13°C"))
        dataCollectionView.append(CollectionViewDemoModel(time: "3PM", celsius: "16°C"))
        dataCollectionView.append(CollectionViewDemoModel(time: "4PM", celsius: "11°C"))
        dataCollectionView.append(CollectionViewDemoModel(time: "5PM", celsius: "11°C"))
        dataCollectionView.append(CollectionViewDemoModel(time: "6PM", celsius: "13°C"))
        dataCollectionView.append(CollectionViewDemoModel(time: "8PM", celsius: "8°C"))
        dataCollectionView.append(CollectionViewDemoModel(time: "9PM", celsius: "5°C"))
        dataTableView.append(ForTenDaysCellModel(day: "Today", minCell: "31", maxCell: "38"))
        dataTableView.append(ForTenDaysCellModel(day: "SUN", minCell: "21", maxCell: "33"))
        dataTableView.append(ForTenDaysCellModel(day: "MON", minCell: "9", maxCell: "11"))
        dataTableView.append(ForTenDaysCellModel(day: "TUES", minCell: "8", maxCell: "5"))
        dataTableView.append(ForTenDaysCellModel(day: "WED", minCell: "1", maxCell: "-2"))
        dataTableView.append(ForTenDaysCellModel(day: "THURS", minCell: "-2", maxCell: "-30"))
    }
}
