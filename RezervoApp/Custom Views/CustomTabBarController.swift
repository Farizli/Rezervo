//
//  CustomTabBarController.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 08.03.23.
//

import UIKit

class CustomTabBarController: UITabBarController {
    
    var heightWidth = 60.0
    var isPlusTapped: Bool = false {
        didSet {
            
            plusBtn.image = !isPlusTapped ? ImageUI.tabbarSearchDefault : ImageUI.tabbarSearchSelected
        }
    }

    lazy private var plusBtn: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.image = ImageUI.tabbarSearchDefault
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        view.addGestureRecognizer(gesture)
//        view.setImage(ImageUI.tabbarSearchDefault, for: .normal)
//        view.setImage(ImageUI.tabbarSearchSelected, for: .selected)
        //        view.backgroundColor = ColorUI.clear
        return view
    }()
    
    lazy var roundedView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 35
        view.layer.shadowColor = ColorUI.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: -6)
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 5
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbar()
    }
    
    private func setupTabbar(){
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(roundedRect: CGRect(x: 20, y: self.tabBar.bounds.minY - 20, width: self.tabBar.bounds.width - 40, height: self.tabBar.bounds.height + 10), cornerRadius: (self.tabBar.frame.width/2)).cgPath
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        layer.shadowRadius = 25.0
        layer.shadowOpacity = 0.4
        layer.borderWidth = 1.0
        layer.opacity = 1.0
        layer.isHidden = false
        layer.masksToBounds = false
        layer.fillColor = UIColor.white.cgColor
        
        self.tabBar.layer.insertSublayer(layer, at: 0)
        
        if let items = self.tabBar.items {
            items.forEach { item in
                item.imageInsets = UIEdgeInsets(top: -15.0, left: 0.0, bottom: 15.0, right: 0.0)
                item.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -20)
            }
        }
        setupButton()
        tabBar.items?[1].titlePositionAdjustment = UIOffset(horizontal: -15, vertical: -20)
        tabBar.items?[2].titlePositionAdjustment = UIOffset(horizontal: 15, vertical: -20)
        tabBar.itemSpacing = 2
        if #available(iOS 15.0, *) {
            tabBar.backgroundImage = UIImage()
            tabBar.shadowImage = UIImage()
            


            // Set the background color to clear
//            tabBar.backgroundColor = .clear
        } else {
            // Fallback on earlier versions
        }
        self.tabBar.itemPositioning = .centered
    }
    
    private func setupButton(){
        
        view.addSubview(plusBtn)
        NSLayoutConstraint.activate([
            plusBtn.bottomAnchor.constraint(equalTo: tabBar.topAnchor, constant: 0.2 * heightWidth),
            plusBtn.centerXAnchor.constraint(equalTo: tabBar.centerXAnchor),
            plusBtn.heightAnchor.constraint(equalToConstant: heightWidth),
            plusBtn.widthAnchor.constraint(equalToConstant: heightWidth),
        ])
//        plusBtn.cornerradius = heightWidth / 2
    }
    @objc func didTap() {
        isPlusTapped = true
        if selectedIndex != NSNotFound {
                    selectedIndex = -1
                }
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        isPlusTapped = false
    }
    
}
