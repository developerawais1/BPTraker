//
//  addwidgetsViewController.swift
//  BP Tracker
//
//  Created by user on 6/7/24.
import UIKit
import WidgetKit
import SwiftUI

class addwidgetsViewController: UIViewController {
    
    @IBOutlet var collection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupAddWidgetButton()
    }
    
    func setupCollectionView() {
        collection.delegate = self
        collection.dataSource = self
        collection.register(UINib(nibName: "widgetsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "widgetsCollectionViewCell")
        if let layout = collection.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
    }
    
    func setupAddWidgetButton() {
        let addWidgetButton = UIButton(type: .system)
        addWidgetButton.setTitle("Add Widget", for: .normal)
        addWidgetButton.addTarget(self, action: #selector(addWidgetButtonTapped), for: .touchUpInside)
        
        // Position and add button to the view
        addWidgetButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(addWidgetButton)
        
        NSLayoutConstraint.activate([
            addWidgetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addWidgetButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    @objc func addWidgetButtonTapped() {
        let userDefaults = UserDefaults(suiteName: "group.com.BP_Tracker.widgets")
        userDefaults?.set("SelectedWidgetConfiguration", forKey: "SelectedWidget")
        WidgetCenter.shared.reloadAllTimelines()
        print("Widget added to home screen.")
    }
}

extension addwidgetsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "widgetsCollectionViewCell", for: indexPath) as? widgetsCollectionViewCell else {
            fatalError("Unable to dequeue widgetsCollectionViewCell")
        }
        switch indexPath.row {
        case 0:
            cell.lbl_widgets.text = "Record BP"
            cell.img_view.image = UIImage(named: "BloodPressure")
        case 1:
            cell.lbl_widgets.text = "Record HR"
            cell.img_view.image = UIImage(named: "HeartRate")
        case 2:
            cell.lbl_widgets.text = "View History"
            cell.img_view.image = UIImage(named: "History")
        default:
            break
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            // Navigate to Record BP Screen
            if let recordBPVC = storyboard?.instantiateViewController(withIdentifier: "RecordBPViewController") {
                navigationController?.pushViewController(recordBPVC, animated: true)
            }
        case 1:
            // Navigate to Record HR Screen
            if let recordHRVC = storyboard?.instantiateViewController(withIdentifier: "RecordHRViewController") {
                navigationController?.pushViewController(recordHRVC, animated: true)
            }
        case 2:
            // Navigate to History Screen
            if let historyVC = storyboard?.instantiateViewController(withIdentifier: "HistoryViewController") {
                navigationController?.pushViewController(historyVC, animated: true)
            }
        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let cellWidth = (collectionViewWidth - 30) / 2
        return CGSize(width: cellWidth, height: 235)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
}
