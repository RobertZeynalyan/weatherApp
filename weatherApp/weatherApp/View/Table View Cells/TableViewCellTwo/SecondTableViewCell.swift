//
//  SecondTableViewCell.swift
//  weatherApp
//
//  Created by Robert on 21.11.23.
//

import UIKit

class SecondTableViewCell: UITableViewCell {

    @IBOutlet weak var forTanDaysTableView: UITableView!
    var collData = CollData()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupTableView() {
        forTanDaysTableView.register(UINib(nibName: "ChildTableViewCell", bundle: nil), forCellReuseIdentifier: "ChildTableViewCell")
        forTanDaysTableView.dataSource = self
        forTanDaysTableView.delegate = self
    }
}

extension SecondTableViewCell: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = forTanDaysTableView.dequeueReusableCell(withIdentifier: "ChildTableViewCell", for: indexPath) as! ChildTableViewCell
        cell.getData(model: collData.dataTableView[indexPath.row])
        return cell
    }
}
