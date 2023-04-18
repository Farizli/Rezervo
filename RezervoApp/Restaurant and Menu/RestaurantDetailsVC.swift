//
//  RestaurantDetailsVC.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 14.04.23.
//

import UIKit


class RestaurantDetailsVC: UIViewController {
    
    var dummyData: [(title: String, body: String)] =
    [
        ("Safety precautions", textt),
        ("Phone", "(999) 999 99 99"),
        ("Price", "$30 and under"),
        ("Cuisine", "Italian"),
        ("Hours of operation", "Breakfast"),
        ("Payment Options", "MasterCard, Visa"),
        ("Parking", "Hotel Parking"),
        ("Dress Code", "Casual Dress"),
        ("Accessibility and inclusion", "Wheelchair Access"),
        ("Description", "Join us for breakfast beneath vaulted ceilings in Zafferano's light-filled dining room, then return in the evening for artful plates of Central Italian specialities, best enjoyed on the terrace on a cool summer's night")
    ]

    @IBOutlet weak var backBtn: UIButton! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
            backBtn.addGestureRecognizer(gesture)
        }
    }
    @IBOutlet weak var detailsTV: UITableView! {
        didSet {
            detailsTV.delegate = self
            detailsTV.dataSource = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc private func didTap(_ sender: UITapGestureRecognizer){
        switch sender.view {
        case backBtn:
            self.dismiss(animated: true)
        default:
            break
        }
    }
    
}

extension RestaurantDetailsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantDetailsTVCell", for: indexPath) as! RestaurantDetailsTVCell
        cell.setupCell(title: dummyData[indexPath.row].title, body: dummyData[indexPath.row].body)
        return cell
    }
    
    
}
