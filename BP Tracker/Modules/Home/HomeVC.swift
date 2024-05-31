//
//  HomeVC.swift
//  BP Tracker
//
//  Created by Rao Ahmad on 19/04/2024.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var homeCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    //MARK: - Functions
    func setupCollectionView() {
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
        self.homeCollectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil),forCellWithReuseIdentifier:"HomeCollectionViewCell")
    }
}

//MARK: - Extension CollectionView
extension HomeVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell",for: indexPath) as? HomeCollectionViewCell? else {
            fatalError()
        }
        switch indexPath.row {
        case 0:
            cell?.homeCellNameLbl.text = "Blood Pressure"
            cell?.homeCellCountLbl.text = "150"
            cell?.homeCellLbl.text = "ml"
            cell?.homeCellImage.image = UIImage(named: "BloodPressure")
        case 1:
            cell?.homeCellNameLbl.text = "Blood Sugar"
            cell?.homeCellCountLbl.text = "135"
            cell?.homeCellLbl.text = "mmol/L"
            cell?.homeCellImage.image = UIImage(named: "BloodSugar")
        case 2:
            cell?.homeCellNameLbl.text = "Heart Rate"
            cell?.homeCellCountLbl.text = "110"
            cell?.homeCellLbl.text = "ml"
            cell?.homeCellImage.image = UIImage(named: "HeartRate")
        case 3:
            cell?.homeCellNameLbl.text = "Weight & BMI"
            cell?.homeCellCountLbl.text = "190"
            cell?.homeCellLbl.text = "mmol/L"
            cell?.homeCellImage.image = UIImage(named: "weight")
        default:
            break
        }
        return cell ?? UICollectionViewCell()
    }
}

