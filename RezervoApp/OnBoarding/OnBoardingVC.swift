//
//  OnBoardingVC.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 22.02.23.
//

import UIKit
import Combine
import SwiftUI

class OnBoardingVC: UIViewController {
    var onboardData: [(title: String, image: UIImage)] = [
        ("find a restaurant according to your wishes".uppercased(), ImageUI.onBoardFirst),
        ("choose a table and book immediately in the application".uppercased(), ImageUI.onBoardSecond),
        ("save your favorite places, inflate reviews".uppercased(), ImageUI.onBoardThird)
    ]
    var currentIndex: Int = 0
    private lazy var swiftUIView = CustomPageControllerView(numberOfItems: 3, widthOfItem: onboardCV.frame.width)

    @IBOutlet weak var skipBtn: UIButton! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
            skipBtn.addGestureRecognizer(gesture)
        }
    }
    @IBOutlet weak var onboardCV: UICollectionView! {
        didSet {
            onboardCV.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")

            onboardCV.delegate = self
            onboardCV.dataSource = self
        }
    }
    @IBOutlet weak var customPageController: UIView!
    @IBOutlet weak var nextBtn: UIButton! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
            nextBtn.addGestureRecognizer(gesture)
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customPageController.addRoot(swiftUIView: swiftUIView)
    }
    
    @objc private func didTap(_ sender: UITapGestureRecognizer){
        switch sender.view{
        case nextBtn:
            currentIndex += 1
            if currentIndex < onboardData.count {
                onboardCV.scrollToItem(at: IndexPath(row: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
            } else {
                let storyboard = UIStoryboard(name: "Login", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        case skipBtn:
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        default:
            break
        }
    }
}

extension OnBoardingVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("ss", scrollView.contentOffset.x)
        swiftUIView.didChangeContentOffset.send(scrollView.contentOffset.x)
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let currentIndex = scrollView.contentOffset.x / scrollView.frame.width
        self.currentIndex = Int(currentIndex.rounded(.down))
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        let currentIndex = scrollView.contentOffset.x / scrollView.frame.width
        self.currentIndex = Int(currentIndex.rounded(.down))
    }
}

extension OnBoardingVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.setup(title: onboardData[indexPath.row].title, image: onboardData[indexPath.row].image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionView.frame.size
    }
    
    
    
    
    
}
