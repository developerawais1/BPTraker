//
//  SettingsTableViewCell.swift
//  BP Tracker
//
//  Created by Rao Ahmad on 22/04/2024.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    @IBOutlet weak var settingsImage: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var forwardImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
