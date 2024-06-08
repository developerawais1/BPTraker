//
//  SettingsVC.swift
//  BP Tracker
//
//  Created by Rao Ahmad on 22/04/2024.
//

import UIKit

class SettingsVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    //MARK: - Functions
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 10.0
        tableView.rowHeight = UITableView.automaticDimension
        self.tableView.register(UINib(nibName: "SettingsTableViewCell", bundle: nil),forCellReuseIdentifier:"SettingsTableViewCell")
    }
}

//MARK: - Extension TableView
extension SettingsVC: UITableViewDelegate ,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell",for: indexPath) as? SettingsTableViewCell? else {
            fatalError()
        }
        switch indexPath.row {
        case 0:
            cell?.nameLbl.text = "Profile"
            cell?.settingsImage.image = UIImage(named: "Profile")
            cell?.forwardImage.image = UIImage(named: "Forward")
        case 1:
            cell?.nameLbl.text = "Reminder"
            cell?.settingsImage.image = UIImage(named: "Reminder")
            cell?.forwardImage.image = UIImage(named: "Forward")
        case 2:
            cell?.nameLbl.text = "Notifications"
            cell?.settingsImage.image = UIImage(named: "Reminder")
            cell?.forwardImage.image = UIImage(named: "Notification")
        case 3:
            cell?.nameLbl.text = "ADD Widgets"
            cell?.settingsImage.image = UIImage(named: "widgets")
            cell?.forwardImage.image = UIImage(named: "Forward")
            
        case 4:
            cell?.nameLbl.text = "About Us"
            cell?.settingsImage.image = UIImage(named: "AboutUs")
            cell?.forwardImage.image = UIImage(named: "Forward")
        default:
            break
        }
        cell?.layer.cornerRadius = 15
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 1:
            let vc = UIStoryboard(name: Storyboards.reminder, bundle: nil).instantiateViewController(withIdentifier: "ReminderVC")
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = UIStoryboard(name: Storyboards.addwidgets, bundle: nil).instantiateViewController(withIdentifier: "addwidgetsViewController")
            navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = UIStoryboard(name: Storyboards.tabBar, bundle: nil).instantiateViewController(withIdentifier: "HistoryVC")
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }

    
}
