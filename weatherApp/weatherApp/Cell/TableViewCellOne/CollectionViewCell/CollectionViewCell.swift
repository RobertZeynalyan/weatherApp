//
//  CollectionViewCell.swift
//  weatherApp
//
//  Created by Robert on 19.11.23.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView?
    @IBOutlet weak var celsiusLabel: UILabel!
    var vc = ViewController()
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        changeDayColors()
    }

    func setup(model: CollectionViewDemoModel) {
        timeLabel.text = model.time
        imageView = model.image
        celsiusLabel.text = model.celsius
    }
}
