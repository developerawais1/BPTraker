//
//  ReminderVC.swift
//  BP Tracker
//
//  Created by Rao Ahmad on 22/04/2024.
//

import UIKit

class ReminderVC: UIViewController {
    
    @IBOutlet weak var reminderVC: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
   
    //MARK: - Functions
    func setupTableView() {
        reminderVC.delegate = self
        reminderVC.dataSource = self
        reminderVC.estimatedRowHeight = 10.0
        reminderVC.rowHeight = UITableView.automaticDimension
        self.reminderVC.register(UINib(nibName: "ReminderTableViewCell", bundle: nil),forCellReuseIdentifier:"ReminderTableViewCell")
    }
}

//MARK: - Extension TableView
extension ReminderVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderTableViewCell",for: indexPath) as? ReminderTableViewCell? else {
            fatalError()
        }
        cell?.layer.cornerRadius = 20
        return cell ?? UITableViewCell()
    }
}
