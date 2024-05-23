//
//  bloodsugarVC.swift
//  BP Tracker
//
//  Created by user on 5/21/24.
//

import UIKit

class bloodsugarVC: UIViewController {

    @IBOutlet var sugarstack: UIView!
    @IBOutlet var bloodSugar: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sugarstack.applyShadow()
        bloodSugar.applyShadow()
    }
}
