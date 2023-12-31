//
//  TableViewCell.swift
//  weatherApp
//
//  Created by Robert on 19.11.23.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    var collData = CollData()
    var vc = ViewController()
    @IBOutlet weak var headerText: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
//        changeDayColors()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCollectionView() {
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
//    
//    func changeDayColors() {
//        if let bol = vc.publicBool {
//            headerText.textColor = UIColor.white
//        } else {
//            headerText.textColor = UIColor.black
//        }
//    }
}

extension TableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collData.dataCollectionView.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell

        cell.setup(model: collData.dataCollectionView[indexPath.row])
        return cell
    }
    
    
}
