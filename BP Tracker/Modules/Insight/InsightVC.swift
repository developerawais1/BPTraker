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
        navigationItem.backButtonTitle = "Insights"
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
            cell.insightCount.text = "03 Insight"
            cell.insightImage.image = UIImage(named: "BloodPressure")
        case 1:
            cell.insightNameLbl.text = "Blood Sugar"
            cell.insightCount.text = "03 Insight"
            cell.insightImage.image = UIImage(named: "BloodSugar")
        case 2:
            cell.insightNameLbl.text = "Heart Rate"
            cell.insightCount.text = "03 Insight"
            cell.insightImage.image = UIImage(named: "HeartRate")
        case 3:
            cell.insightNameLbl.text = "Weight & BMI"
            cell.insightCount.text = "03 Insight"
            cell.insightImage.image = UIImage(named: "weight")
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
        let vc = UIStoryboard(name: Storyboards.insight, bundle: nil).instantiateViewController(withIdentifier: "HeartInsightVC") as! HeartInsightVC
        switch indexPath.row {
        case 0:
            vc.cellData = ["Understand about your Blood pressure ", "Learn About your Blood Pressure ", "How to keep  blood Perssure normal",]
            vc.cellImges = ["BloodPressure","BloodPressure","BloodPressure"]
            vc.cellDatails = ["Blood pressure is the pressure of blood on the walls of your arteries as your heart pumps blood around your body. Blood pressure does not stay the same all the time. It changes to meet your body's needs and it is normal for your blood pressure to go up and down throughout the day", "Healthy blood pressure for men of age 18-39 is 119/70 mm Hg and that of women is 110/68 mm Hg. Healthy blood pressure for men of age 40-56 is 124/77 mm Hg and that of women is 122/74 mm Hg. Healthy blood pressure for men of age 60+ is 133/69 mm Hg and that of women is 139/68 mm Hg.","You can try breathing exercises and drinking water to help lower your blood pressure within 5 minutes. But you may also need to call 911 or seek emergency medical help. A blood pressure emergency occurs when your blood pressure reaches 180/120 or above. This can happen with or without causing symptoms"]
        case 1:

            vc.cellData = ["Understand about your Blood Sugar ", "Learn About your Blood sugar ", "How to keep  blood sugar normal",]
            vc.cellImges = ["BloodSugar","BloodSugar","BloodSugar"]
            vc.cellDatails = ["Blood glucose, or blood sugar, is the main sugar found in your blood. It is your body's primary source of energy. It comes from the food you eat. Your body breaks down most of that food into glucose and releases it into your bloodstream.","The expected values for normal fasting blood glucose concentration are between 70 mg/dL (3.9 mmol/L) and 100 mg/dL (5.6 mmol/L). When fasting blood glucose is between 100 to 125 mg/dL (5.6 to 6.9 mmol/L) changes in lifestyle and monitoring glycemia are recommended","Leafy greens and non-starchy vegetables. Leafy greens such as romaine, kale, and spinach, along with non-starchy vegetables (for example, peppers, tomatoes, and onions) are high in fiber, low in calories, and nutrient-rich"]
        case 2:

            vc.cellData = ["Understand about your heart", "Learn About Atrial Fibrillation burden", "Understand About Your Heart Rate",]
            vc.cellImges = ["Heart 1","Heart 1","Heart 1"]
            vc.cellDatails = ["The heart is a fist-sized organ that pumps blood throughout your body. It's your circulatory system's main organ. Muscle and tissue make up this powerhouse organ. Your heart contains four muscular sections (chambers) that briefly hold blood before moving it","There are many ways one can define AF burden, such as the duration of the longest AF episode or number of AF episodes during a certain monitoring period. Intuitively, the best definition for AF burden is the proportion of time an individual is in AF during a monitoring period, expressed as a percentage.","Your pulse rate, also known as your heart rate, is the number of times your heart beats per minute. A normal resting heart rate should be between 60 to 100 beats per minute, but it can vary from minute to minute."]
        case 3:
            vc.cellData = ["Understand about your weight ", "how to check ypur weight ", "How to keep control weight",]
            vc.cellImges = ["weight","weight","weight"]
            
            vc.cellDatails = ["If your BMI is less than 18.5, it falls within the underweight range. If your BMI is 18.5 to 24.9, it falls within the Healthy Weight range. If your BMI is 25.0 to 29.9, it falls within the overweight range. If your BMI is 30.0 or higher, it falls within the obese range.","To weigh yourself using a digital or dial scale, place the scale on a flat surface and step onto it. Then, simply read the numbers to find out how much you weigh. Alternatively, if using a balance beam scale, step on the scale, adjust the weights, and add up the numbers.","Decreasing your intake of processed foods and added sugar can help you lose weight in 7 days. Drinking plenty of water and adding fiber to your diet might also help. That said, many factors influence your ability to lose weight, and it's better to aim for slower and more sustainable weight loss of 0.5–2 lbs per week."]
        default:
            return
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
