//
//  HeartInsightVC.swift
//  BP Tracker
//
//  Created by user on 5/27/24.
//
import UIKit

class HeartInsightVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
  //  @IBOutlet var mainShadow: UIView!
    @IBOutlet var tableViewShadow: UITableView!
    let cellIdentifier = "HeartInsightCell"
    var cellData = [String]()
    var cellImges = [String]()
    var cellDatails = [String]()


    let cellSpacingHeight: CGFloat = 0.5 // Adjust the spacing height as needed

    override func viewDidLoad() {
        super.viewDidLoad()
//        mainShadow.applyShadow()
        tableViewShadow.applyShadow()

        // Register the custom cell
        let nib = UINib(nibName: "HeartInsightTableViewCell", bundle: nil)
        tableViewShadow.register(nib, forCellReuseIdentifier: cellIdentifier)
        
        tableViewShadow.delegate = self
        tableViewShadow.dataSource = self
        
        // Remove default separators
        tableViewShadow.separatorStyle = .none
    }
    
    // MARK: - UITableViewDataSource Methods
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! HeartInsightTableViewCell
        cell.lbl_view.text = cellData[indexPath.row]
        cell.img_view.image = UIImage(named: cellImges[indexPath.row])
        return cell
    }
    
    // MARK: - UITableViewDelegate Methods
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 118 // Set an appropriate height for your cells
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView()
        footerView.backgroundColor = UIColor.clear // Set background color to clear
        return footerView
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "HRP") as! HRPassDataViewController
        vc.insightText = cellData[indexPath.row]
        vc.insightImage = cellImges[indexPath.row]
        vc.insightDetail = cellDatails[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension UIView {
    func applyShadow(cornerRadius: CGFloat = 3,
                     shadowColor: UIColor = UIColor(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 1.0),
                     shadowOffset: CGSize = CGSize(width: 0, height: 1.75),
                     shadowRadius: CGFloat = 1.8,
                     shadowOpacity: Float = 0.2) {
        
       // self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = shadowOffset
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = shadowOpacity
    }
}
