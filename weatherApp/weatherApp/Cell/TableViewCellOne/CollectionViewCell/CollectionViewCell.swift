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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setup(model: CollectionViewDemoModel) {
        timeLabel.text = model.time
        imageView = model.image
        celsiusLabel.text = model.celsius
    }
}
