//
//  DisclaimerVC.swift
//  BP Tracker
//
//  Created by Rao Ahmad on 18/04/2024.
//

import UIKit

class DisclaimerVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    @IBAction func continueButton(_ sender: UIButton) {
        let vc = UIStoryboard(name: Storyboards.onBoarding, bundle: nil).instantiateViewController(withIdentifier: "MeasurementVC")
        navigationController?.pushViewController(vc, animated: true)
    }
}
