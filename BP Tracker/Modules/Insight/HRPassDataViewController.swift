//
//  HRPassDataViewController.swift
//  BP Tracker
//
//  Created by user on 5/20/24.
//

import UIKit

class HRPassDataViewController: UIViewController {
    @IBOutlet var insightImageView: UIImageView!
    @IBOutlet var insightLabel: UILabel!

    @IBOutlet var insightDetailTextView: UITextView!
    var insightText: String?
    var insightImage: String = ""
    var insightDetail: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        print(insightImage)
        // Set the data to the outlets
        insightLabel.text = insightText
        insightImageView.image = UIImage(named: insightImage + " detail")
        insightDetailTextView.text = insightDetail
        
    }
}
