//
//  YourLocationVC.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 15.03.23.
//

import UIKit

class YourLocationVC: UIViewController {

    @IBOutlet weak var locationList: UITableView! {
        didSet {
            locationList.delegate = self
            locationList.dataSource = self
        }
    }
    @IBOutlet weak var searchView: CustomSearchView! {
        didSet {
            searchView.type = .defaultSearch
            searchView.placeholder = "Enter a new address"
        }
    }
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var mainTitle: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}

extension YourLocationVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LocTVCell", for: indexPath) as! LocTVCell
        
        if indexPath.row == 0 {
            cell.setupCell(image: ImageUI.currentLocation , title: "Current location")
        } else {
            cell.setupCell(image: ImageUI.location , title: "Another address")
        }
        
        return cell
    }
    
    
}
