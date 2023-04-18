//
//  HistoryHeaderView.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 23.03.23.
//

import UIKit

class HistoryHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var titleLbl: UILabel!
    

    func setupHeader(title: String) {
        self.titleLbl.text = title
    }
}
