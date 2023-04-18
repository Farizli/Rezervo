//
//  NotificationsVC.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 15.03.23.
//

import UIKit

class NotificationsVC: UIViewController {
    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var notificationTV: UITableView! {
        didSet {
            notificationTV.dataSource = self
            notificationTV.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}

extension NotificationsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationTVCell", for: indexPath) as! NotificationTVCell
        
        if indexPath.row == 0 {
            cell.setupCell(photo: ImageUI.pentagonSp, note: "Restaurant Note", status: "Just now", title: "Restaurant name", isNew: true)
        } else {
            cell.setupCell(photo: ImageUI.pentagonSp, note: "Restaurant Note", status: "3 days", title: "Restaurant name", isNew: false)
        }
        return cell
    }
    
    
}
