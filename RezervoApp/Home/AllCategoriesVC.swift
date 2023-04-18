//
//  AllCategoriesVC.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 13.03.23.
//

import UIKit

class AllCategoriesVC: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var topView: UIView! {
        didSet {
            topView.layer.cornerRadius = 20
            topView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
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
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    


}


extension AllCategoriesVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 10, height: collectionView.frame.height / 3)
    }
    
    
}
