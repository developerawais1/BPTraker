//
//  addwidgetsViewController.swift
//  BP Tracker
//
//  Created by user on 6/7/24.
//
import UIKit

class addwidgetsViewController: UIViewController {

    @IBOutlet var collection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    func setupCollectionView() {
        collection.delegate = self
        collection.dataSource = self
        collection.register(UINib(nibName: "widgetsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "widgetsCollectionViewCell")
        if let layout = collection.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
        }
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
            cell.img_widgets.image = UIImage(named: "BloodPressure")
        case 1:
            cell.lbl_widgets.text = "Record HR"
            cell.img_widgets.image = UIImage(named: "HeartRate")
        case 2:
            cell.lbl_widgets.text = "View History"
            cell.img_widgets.image = UIImage(named: "History")
        default:
            break
        }
        return cell
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

//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let alert = UIAlertController(title: "Add to Home Screen", message: "Would you like to add this widget to your home screen?", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
//            self.addWidgetToHomeScreen(at: indexPath.row)
//        }))
//        self.present(alert, animated: true, completion: nil)
//    }

//    func addWidgetToHomeScreen(at index: Int) {
//        let widgetConfiguration: String
//        switch index {
//        case 0:
//            widgetConfiguration = "RecordBP"
//        case 1:
//            widgetConfiguration = "RecordHR"
//        case 2:
//            widgetConfiguration = "ViewHistory"
//        default:
//            return
//        }
//
//        // Save configuration to shared UserDefaults
//        let userDefaults = UserDefaults(suiteName: "group.com.yourapp.widgets")
//        userDefaults?.set(widgetConfiguration, forKey: "SelectedWidget")
//
//        // Refresh the widget
//        WidgetCenter.shared.reloadAllTimelines()
//
//        print("Widget at index \(index) added to home screen.")
//    }
}
