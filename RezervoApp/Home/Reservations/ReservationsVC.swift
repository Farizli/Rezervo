//
//  ReservationsVC.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 01.04.23.
//

import UIKit

class ReservationsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
//            tableView.register(UINib(nibName: "ReservationsTVCell", bundle: nil), forCellReuseIdentifier: "ReservationsTVCell")
            tableView.register(UINib(nibName: "HistoryHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "HistoryHeaderView")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

}


extension ReservationsVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReservationsTVCell", for: indexPath) as! ReservationsTVCell
        if indexPath.section == 0{
            cell.setupCell(rowNum: 2)
        } else {
            cell.setupCell(rowNum: 1)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HistoryHeaderView") as! HistoryHeaderView
        if section == 0 {
            view.setupHeader(title: "Today (2)")
        } else {
            view.setupHeader(title: "February 20")
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    
}
