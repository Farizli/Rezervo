//
//  HomeVC.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 19.03.23.
//

import UIKit

class HomeVC: UIViewController {
    
    var cellType: CellType?

    @IBOutlet weak var restaurantTV: UITableView! {
        didSet {
            restaurantTV.delegate = self
            restaurantTV.dataSource = self
            restaurantTV.register(UINib(nibName: "HeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "HeaderView")

        }
    }
    @IBOutlet weak var redView: UIView! {
        didSet {
            redView.layer.cornerRadius = redView.frame.height / 2
        }
    }
    @IBOutlet weak var notificationsBtn: UIButton!
    @IBOutlet weak var yourLocationBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantsTVCell", for: indexPath) as! RestaurantsTVCell
        if indexPath.section == 4 {
            cell.setupCell(type: .narrow)
        } else {
            cell.setupCell(type: .wide)
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as! HeaderView
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    
}
