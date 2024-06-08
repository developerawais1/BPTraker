
//
//  ReminderTableViewCell.swift
//  BP Tracker
//
//  Created by Rao Ahmad on 22/04/2024.
//

import UIKit

class ReminderTableViewCell: UITableViewCell {

    @IBOutlet var timeLabel: UITextField!
    @IBOutlet weak var daysLabel: UILabel!
    @IBOutlet weak var notificationSwitch: UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        notificationSwitch.isOn = false
        notificationSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .valueChanged)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureCell(time: String, days: String, notificationOn: Bool) {
        timeLabel.text = time
        daysLabel.text = days
        notificationSwitch.isOn = notificationOn
    }

    @objc func switchValueChanged(_ sender: UISwitch) {
        // Handle the switch value change here
        if sender.isOn {
            print("Switch is ON")
        } else {
            print("Switch is OFF")
        }
    }
}
