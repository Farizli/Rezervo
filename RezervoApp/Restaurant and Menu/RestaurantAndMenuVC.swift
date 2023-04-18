//
//  RestaurantAndMenuVC.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 14.04.23.
//

import UIKit

class RestaurantAndMenuVC: UIViewController {
    
    var currentOffset: CGFloat = 0.0
    
    @IBOutlet weak var infoBtn: UIButton! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
            infoBtn.addGestureRecognizer(gesture)
        }
    }
    
    @IBOutlet weak var reservBtn: CustomButton! {
        didSet {
            reservBtn.type = .highImportance
        }
    }
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: "MenuTVCell", bundle: nil), forCellReuseIdentifier: "MenuTVCell")
            
            
        }
    }
    @IBOutlet weak var segmentView: CustomSegmentView! {
        didSet {
            segmentView.viewData = ["Dessert", "Drinks", "Pizza", "Pasta", "Soups", "Snacks"]
        }
    }
    @IBOutlet weak var discountView: UIView! {
        didSet {
            discountView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var distanceView: UIView! {
        didSet {
            distanceView.layer.cornerRadius = 10
        }
    }
    @IBOutlet weak var backView: UIView! {
        didSet {
            backView.layer.cornerRadius = 17.5
            
        }
    }
    @IBOutlet weak var photo: UIImageView! {
        didSet {
            photo.layer.cornerRadius = 30
            photo.layer.maskedCorners = [ .layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @objc private func didTap(_ sender: UITapGestureRecognizer){
        switch sender.view {
        case infoBtn:
            let storyboard = UIStoryboard(name: "MakeReservation", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "MakeReservationVC") as! MakeReservationVC
            self.present(vc, animated: true, completion: nil)
        default:
            break
            
        }
    }
    
    
    
}

extension RestaurantAndMenuVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTVCell", for: indexPath) as! MenuTVCell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var isScrollDown: CGFloat?
        isScrollDown = currentOffset < scrollView.contentOffset.y ? -1.0 : 1.0

        currentOffset = scrollView.contentOffset.y
//        print(tableView.contentOffset.y)
        
        
        if topConstraint.constant >= 0 && topConstraint.constant <= 100 {
            
            if scrollView.contentOffset.y > 50 {
                if topConstraint.constant >= 0 && isScrollDown != -1 && topConstraint.constant < 100 {
                    topConstraint.constant += (isScrollDown ?? 0.0)
                } else if topConstraint.constant <= 100 && isScrollDown != 1 && topConstraint.constant > 0   {
                    topConstraint.constant += (isScrollDown ?? 0.0)
                }
            }else {
                
                UIView.animate(withDuration: 0.5, delay: 0.0, options: .beginFromCurrentState) {
                    if isScrollDown == 1 {
                        self.topConstraint.constant = 100
                    } else {
                        self.topConstraint.constant = 0
                    }
                    self.view.layoutIfNeeded()
                }
            }

            print("ici", topConstraint.constant, isScrollDown)

            
        photo.layoutIfNeeded()
            
        }
        
        
        print("colu",topConstraint.constant , isScrollDown, scrollView.contentOffset.y)

        
        
    }
    
    
}
