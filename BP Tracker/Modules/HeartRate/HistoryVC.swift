//
//  HistoryVC.swift
//  BP Tracker
//
//  Created by Rao Ahmad on 23/04/2024.
//

import UIKit

class HistoryVC: UIViewController {
    
    @IBOutlet weak var historyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
   
    //MARK: - Helper Function
    func setupTableView() {
        historyTableView.delegate = self
        historyTableView.dataSource = self
        historyTableView.rowHeight = UITableView.automaticDimension
        self.historyTableView.register(UINib(nibName: "HistoryTableViewCell", bundle: nil),forCellReuseIdentifier:"HistoryTableViewCell")
    }
}

//MARK: - Extension TableView
extension HistoryVC: UITableViewDelegate ,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTableViewCell",for: indexPath) as? HistoryTableViewCell? else {
            fatalError()
        }
        switch indexPath.row {
        case 0:
            cell?.rangeLbl.text = "120 - 150"
            cell?.levelLbl.text = "Normal"
            cell?.rateLbl.text = "Pulse: 77BPM"
            cell?.timeLbl.text = "11:35, 14/08/2024"
        case 1:
            cell?.rangeLbl.text = "110 - 70"
            cell?.levelLbl.text = "Hypertension Stage ||"
            cell?.rateLbl.text = "Pulse: 80 BPM"
            cell?.timeLbl.text = "12:35, 14/09/2024"
        case 2:
            cell?.rangeLbl.text = "100 - 40"
            cell?.levelLbl.text = "Elevated"
            cell?.rateLbl.text = "Pulse: 90BPM"
            cell?.timeLbl.text = "1:35, 14/10/2024"
        default:
            break
        }
        return cell ?? UITableViewCell()
    }
}
