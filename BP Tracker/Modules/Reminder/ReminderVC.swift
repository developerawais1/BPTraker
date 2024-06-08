//
//  ReminderVC.swift
//  BP Tracker
//
//  Created by Rao Ahmad on 22/04/2024.
//

import UIKit

class ReminderVC: UIViewController {
    
    @IBOutlet weak var reminderVC: UITableView!
    @IBOutlet var addReminderoutlits: UIButton!
    
    // Array to store reminders
    var reminders: [String] = ["Reminder 1", "Reminder 2"]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
   
    @IBAction func addReminderAction(_ sender: UIButton) {
        let alert = UIAlertController(title: "Manage Reminders", message: "What would you like to do?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Add Reminder", style: .default, handler: { _ in
            self.addReminder()
        }))
//        alert.addAction(UIAlertAction(title: "Delete Reminder", style: .destructive, handler: { _ in
//            self.setTableViewEditing(true)
//        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func addReminder() {
        let newReminder = "New Reminder"
        reminders.append(newReminder)
        let newIndexPath = IndexPath(row: reminders.count - 2, section: 0)
        reminderVC.insertRows(at: [newIndexPath], with: .automatic)
    }
  
    //MARK: - Functions
    func setupTableView() {
        reminderVC.delegate = self
        reminderVC.dataSource = self
        reminderVC.estimatedRowHeight = 10.0
        reminderVC.rowHeight = UITableView.automaticDimension
        self.reminderVC.register(UINib(nibName: "ReminderTableViewCell", bundle: nil), forCellReuseIdentifier: "ReminderTableViewCell")
    }
    
    func setTableViewEditing(_ editing: Bool) {
        reminderVC.setEditing(editing, animated: true)
    }
}

//MARK: - Extension TableView
extension ReminderVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminders.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReminderTableViewCell", for: indexPath) as? ReminderTableViewCell else {
            fatalError()
        }
        cell.layer.cornerRadius = 20
        return cell
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the reminder from the array
            reminders.remove(at: indexPath.row)
            // Delete the row from the table view
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
