//
//  weightVC.swift
//  BP Tracker
//
//  Created by user on 5/21/24.
//

import UIKit

class weightVC: UIViewController {

    @IBOutlet var weightstack: UIStackView!
    @IBOutlet var wightView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        weightstack.applyShadow()
        wightView.applyShadow()
    }
}
