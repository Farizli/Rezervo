//
//  HeaderView.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 19.03.23.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var seeAllBtn: UIView! {
        didSet {
            seeAllBtn.layer.cornerRadius = seeAllBtn.frame.height / 2
            seeAllBtn.layer.shadowOpacity = 0.2
            seeAllBtn.layer.shadowRadius = 5
            seeAllBtn.layer.shadowOffset = CGSize(width: 0, height: 2)
            seeAllBtn.layer.shadowColor = UIColor.black.cgColor
        }
    }
    
    
}
