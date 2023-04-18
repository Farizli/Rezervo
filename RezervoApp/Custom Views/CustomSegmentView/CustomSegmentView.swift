//
//  CustomSegmentView.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 04.04.23.
//

import UIKit

class CustomSegmentView: UIView {
    
    lazy var slidingView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = ColorUI.background
        view.layer.cornerRadius = 15
        view.layer.shadowOpacity = 0.2
        view.layer.shadowRadius = 5
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        
        return view
    }()
    var selectedIndex = 0
    private var sliderWidth: NSLayoutConstraint?
    private var sliderCenterX: NSLayoutConstraint?
    var viewData: [String]? = ["aaa", "hvfdsahjgf", "sdsf", "fsbdbfdsb", "adsfaa", "aafja", "aaa", "hvfdsahjgf", "sdsf", "fsbdbfdsb", "adsfaa", "aafja"] {
        didSet {
            collectionVIew.reloadData()
        }
    }
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = containerView.frame.height / 2
        }
    }
    
    @IBOutlet weak var collectionVIew: UICollectionView! {
        didSet {
            collectionVIew.delegate = self
            collectionVIew.dataSource = self
            collectionVIew.register(UINib(nibName: "CustomSegmentCVCell", bundle: nil), forCellWithReuseIdentifier: "CustomSegmentCVCell")
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView(){
        let view = Bundle.main.loadNibNamed("CustomSegmentView", owner: self)?.first as! UIView
        addSubview(view)
        view.frame = bounds
        addInnerShadow()
        clipsToBounds = true
        setupSlider()
    }
    private func setupSlider(){
        addSubview(slidingView)
        sendSubviewToBack(slidingView)
        DispatchQueue.main.async {
            guard let cell = self.collectionVIew.cellForItem(at: IndexPath(row: 0, section: 0)) else {return}
            self.sliderWidth = self.slidingView.widthAnchor.constraint(equalToConstant: cell.frame.width)
            self.sliderCenterX = self.slidingView.centerXAnchor.constraint(equalTo: cell.centerXAnchor)
            NSLayoutConstraint.activate([
                self.slidingView.heightAnchor.constraint(equalToConstant: cell.frame.height - 10),
                self.sliderWidth!,
                self.sliderCenterX!,
                self.slidingView.centerYAnchor.constraint(equalTo: cell.centerYAnchor)
            ])
        }
        
    }
}

extension CustomSegmentView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewData?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomSegmentCVCell", for: indexPath) as! CustomSegmentCVCell
        cell.setupCell(title: self.viewData?[indexPath.row] ?? "", isSelected: selectedIndex == indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let viewData else {return .zero}
        let string = viewData[indexPath.row]
        let sizeForCell: CGSize = string.size(withAttributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14.0)])
        return CGSize(width: sizeForCell.width + 30, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        guard let cell = collectionView.cellForItem(at: indexPath) else {return}
        selectedIndex = indexPath.row
        sliderWidth?.isActive = false
        sliderWidth = slidingView.widthAnchor.constraint(equalToConstant: cell.frame.width)
        sliderWidth?.isActive = true
        sliderCenterX?.isActive = false
        sliderCenterX = slidingView.centerXAnchor.constraint(equalTo: cell.centerXAnchor)
        sliderCenterX?.isActive = true
        UIView.transition(with: self, duration: 0.3, options: .beginFromCurrentState) {
            self.layoutIfNeeded()
        }
        collectionView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard sliderWidth != nil, sliderCenterX != nil else {return}
        if indexPath.row == selectedIndex{
            sliderWidth?.isActive = false
            sliderWidth = slidingView.widthAnchor.constraint(equalToConstant: cell.frame.width)
            sliderWidth?.isActive = true
            sliderCenterX?.isActive = false
            sliderCenterX = slidingView.centerXAnchor.constraint(equalTo: cell.centerXAnchor)
            sliderCenterX?.isActive = true
//            UIView.transition(with: self, duration: 0.3, options: .beginFromCurrentState) {
//                self.layoutIfNeeded()
//            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == selectedIndex{
            sliderWidth?.isActive = false
            sliderCenterX?.isActive = false
        }
    }
}
