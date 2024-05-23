//
//  bloodInsightVC.swift
//  BP Tracker
//
//  Created by user on 5/21/24.
//

import UIKit

class bloodInsightVC: UIViewController {
    
   
    @IBOutlet var bloodstack: UIStackView!
    @IBOutlet var bloosinsightview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        bloodstack.applyShadow()
        bloosinsightview.applyShadow()

    }
}

