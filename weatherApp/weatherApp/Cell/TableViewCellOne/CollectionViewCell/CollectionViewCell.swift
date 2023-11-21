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
    
//    func changeDayColors() {
//        if let bol = vc.publicBool {
//            timeLabel.textColor = UIColor.white
//            celsiusLabel.textColor = UIColor.white
//            imageView?.tintColor = UIColor.white
//        } else {
//            timeLabel.textColor = UIColor.black
//            celsiusLabel.textColor = UIColor.black
//            imageView?.tintColor = UIColor.black
//        }
//    }
}
