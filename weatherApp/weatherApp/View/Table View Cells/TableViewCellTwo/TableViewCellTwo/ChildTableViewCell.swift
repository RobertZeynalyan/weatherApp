//
//  ChildTableViewCell.swift
//  weatherApp
//
//  Created by Robert on 21.11.23.
//

import UIKit

class ChildTableViewCell: UITableViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var minCels: UILabel!
    @IBOutlet weak var maxCels: UILabel!
    @IBOutlet weak var progressLine: UIProgressView!
    var vc = ViewController()
    override func awakeFromNib() {
        super.awakeFromNib()
//        changeDayColors()   
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func getData(model: ForTenDaysCellModel) {
        
        dayLabel.text = model.day
        minCels.text = model.minCell
        maxCels.text = model.maxCell
        weatherImage = model.weatherImage
        progressLine = model.progressLine
    }
    
    
//    func changeDayColors() {
//        if let bol = vc.publicBool {
//            dayLabel.textColor = UIColor.white
//            minCels.textColor = UIColor.white
//            maxCels.textColor = UIColor.white
//            weatherImage.tintColor = UIColor.white
//        } else {
//            dayLabel.textColor = UIColor.black
//            minCels.textColor = UIColor.black
//            maxCels.textColor = UIColor.black
//            weatherImage.tintColor =  UIColor.black
//        }
//    }
}
