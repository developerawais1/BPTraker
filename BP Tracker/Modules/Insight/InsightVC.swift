//
//  InsightVC.swift
//  BP Tracker
//
//  Created by Rao Ahmad on 22/04/2024.
//

import UIKit

class InsightVC: UIViewController {
    
    @IBOutlet weak var insightCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigationBar()
    }
    
    // MARK: - Functions
    func setupCollectionView() {
        insightCollectionView.delegate = self
        insightCollectionView.dataSource = self
        self.insightCollectionView.register(UINib(nibName: "InsightCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "InsightCollectionViewCell")
    }
    
    func setupNavigationBar() {
        // Set back button title to empty string
        navigationItem.backButtonTitle = ""
        // Set back button color to white
        navigationController?.navigationBar.tintColor = .white
        
        // Set title color to white
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
    }
}

// MARK: - Extension CollectionView
extension InsightVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InsightCollectionViewCell", for: indexPath) as? InsightCollectionViewCell else {
            fatalError()
        }
        switch indexPath.row {
        case 0:
            cell.insightNameLbl.text = "Blood Pressure"
            cell.insightCount.text = "17 Insight"
            cell.insightImage.image = UIImage(named: "BloodPressure")
        case 1:
            cell.insightNameLbl.text = "Blood Sugar"
            cell.insightCount.text = "06 Insight"
            cell.insightImage.image = UIImage(named: "BloodSugar")
        case 2:
            cell.insightNameLbl.text = "Heart Rate"
            cell.insightCount.text = "10 Insight"
            cell.insightImage.image = UIImage(named: "HeartRate")
        case 3:
            cell.insightNameLbl.text = "Weight & BMI"
            cell.insightCount.text = "08 Insight"
            cell.insightImage.image = UIImage(named: "StartTwo")
        default:
            break
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let cellWidth = collectionViewWidth / 2 - 10
        return CGSize(width: cellWidth, height: 235)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboardName: String
        let viewControllerID: String
        
        switch indexPath.row {
        case 0:
            storyboardName = Storyboards.bloodInsight
            viewControllerID = "bloodInsight"
        case 1:
            storyboardName = Storyboards.bloodsugar
            viewControllerID = "bloodsugar"
        case 2:
            storyboardName = Storyboards.insight
            viewControllerID = "HeartInsightVC"
        case 3:
            storyboardName = Storyboards.weight
            viewControllerID = "weight"
        default:
            return
        }
        
        let vc = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: viewControllerID)
        navigationController?.pushViewController(vc, animated: true)
    }
}
