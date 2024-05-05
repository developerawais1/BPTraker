//
//  HistoryTableViewCell.swift
//  BP Tracker
//
//  Created by Rao Ahmad on 23/04/2024.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var rangeLbl: UILabel!
    @IBOutlet weak var levelLbl: UILabel!
    @IBOutlet weak var rateLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
