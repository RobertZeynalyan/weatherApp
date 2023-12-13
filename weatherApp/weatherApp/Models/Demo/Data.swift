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
    var vc = ViewController()
    
    init() {
        getData()
    }  
    
    private func getData() {
        for item in vc.weatherFromHours {
            
            let item = Int(item)
            dataCollectionView.append(CollectionViewDemoModel(time: "12AM", celsius: "\(String(item))°C"))
        }
        dataCollectionView.append(CollectionViewDemoModel(time: "12AM", celsius: "12°C"))
        dataCollectionView.append(CollectionViewDemoModel(time: "3PM", celsius: "13°C"))
        dataCollectionView.append(CollectionViewDemoModel(time: "6PM", celsius: "16°C"))
        dataCollectionView.append(CollectionViewDemoModel(time: "9PM", celsius: "11°C"))
        dataCollectionView.append(CollectionViewDemoModel(time: "12PM", celsius: "11°C"))
        dataTableView.append(ForTenDaysCellModel(day: "Today", minCell: "31", maxCell: "38"))
        dataTableView.append(ForTenDaysCellModel(day: "SUN", minCell: "21", maxCell: "33"))
        dataTableView.append(ForTenDaysCellModel(day: "MON", minCell: "9", maxCell: "11"))
        dataTableView.append(ForTenDaysCellModel(day: "TUES", minCell: "8", maxCell: "5"))
        dataTableView.append(ForTenDaysCellModel(day: "WED", minCell: "1", maxCell: "-2"))
        dataTableView.append(ForTenDaysCellModel(day: "THURS", minCell: "-2", maxCell: "-30"))
    }
}
