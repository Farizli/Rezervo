//
//  HistoryVC.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 23.03.23.
//

import UIKit

class HistoryVC: UIViewController {

    @IBOutlet weak var historyTV: UITableView! {
        didSet {
            historyTV.delegate = self
            historyTV.dataSource = self
            historyTV.register(UINib(nibName: "HistoryTVCell", bundle: nil), forCellReuseIdentifier: "HistoryTVCell")
            historyTV.register(UINib(nibName: "HistoryHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "HistoryHeaderView")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}

extension HistoryVC: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryTVCell", for: indexPath) as! HistoryTVCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HistoryHeaderView") as! HistoryHeaderView
        if section == 0 {
            view.setupHeader(title: "Today")
        } else {
            view.setupHeader(title: "13 february")
        }
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    
}
