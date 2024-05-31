//
//  HeartInsightTableViewCell.swift
//  BP Tracker
//
//  Created by user on 5/27/24.
//

import UIKit

class HeartInsightTableViewCell: UITableViewCell {
    @IBOutlet var img_view: UIImageView!
    @IBOutlet var lbl_view: UILabel!


    // Helper function to find the view controller this cell is contained in
    func getOwningViewController() -> UIViewController? {
        var nextResponder: UIResponder? = self
        while nextResponder != nil {
            nextResponder = nextResponder?.next
            if let HeartInsightVC = nextResponder as? UIViewController {
                return HeartInsightVC
            }
        }
        return nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
