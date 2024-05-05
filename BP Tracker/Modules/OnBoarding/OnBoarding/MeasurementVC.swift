//
//  MeasurementVC.swift
//  BP Tracker
//
//  Created by Rao Ahmad on 19/04/2024.
//

import UIKit

class MeasurementVC: UIViewController {

    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var viewTwo: UIView!
    @IBOutlet weak var viewThree: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        styleView(to: viewOne)
        styleView(to: viewTwo)
        styleView(to: viewThree)
    }

    //MARK: - Functions
    func styleView(to view: UIView) {
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        let lighterColor = UIColor(red: 249/255 + 0.2, green: 79/255 + 0.2, blue: 87/255 + 0.2, alpha: 1.0)
        view.layer.borderColor = lighterColor.cgColor
    }
}

//MARK: - Actions
extension MeasurementVC {
    @IBAction func continueButton(_ sender: UIButton) {
        let tabBarController = UIStoryboard(name: Storyboards.tabBar, bundle: Bundle.main).instantiateViewController(withIdentifier: "TabBarController")
        tabBarController.modalPresentationStyle = .fullScreen
        present(tabBarController, animated: false, completion: nil)
    }
}
