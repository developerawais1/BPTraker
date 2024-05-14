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
    }
    
    //MARK: - Functions
    func setupCollectionView() {
        insightCollectionView.delegate = self
        insightCollectionView.dataSource = self
        self.insightCollectionView.register(UINib(nibName: "InsightCollectionViewCell", bundle: nil),forCellWithReuseIdentifier:"InsightCollectionViewCell")
    }
}

//MARK: - Extension CollectionView
extension InsightVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InsightCollectionViewCell",for: indexPath) as? InsightCollectionViewCell? else {
            fatalError()
        }
        switch indexPath.row {
        case 0:
            cell?.insightNameLbl.text = "Blood Pressure"
            cell?.insightCount.text = "17 Insight"
            cell?.insightImage.image = UIImage(named: "BloodPressure")
        case 1:
            cell?.insightNameLbl.text = "Blood Sugar"
            cell?.insightCount.text = "06 Insight"
            cell?.insightImage.image = UIImage(named: "BloodSugar")
        case 2:
            cell?.insightNameLbl.text = "Heart Rate"
            cell?.insightCount.text = "10 Insight"
            cell?.insightImage.image = UIImage(named: "HeartRate")
        case 3:
            cell?.insightNameLbl.text = "Weight & BMI"
            cell?.insightCount.text = "08 Insight"
            cell?.insightImage.image = UIImage(named: "StartTwo")
        default:
            break
        }
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let cellWidth = collectionViewWidth / 2 - 10
        return CGSize(width: cellWidth, height: 235)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 2:
            let vc = UIStoryboard(name: Storyboards.insight, bundle: nil).instantiateViewController(withIdentifier: "HeartInsightVC")
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
}
