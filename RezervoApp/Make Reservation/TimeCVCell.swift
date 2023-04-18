//
//  TimeCVCell.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 16.04.23.
//

import UIKit

class TimeCVCell: UICollectionViewCell {
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 15
        }
    }
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var notifIcon: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(title: String, type: SelectionState) {
        self.title.text = title
        
        switch type {
        case .selected:
            self.notifIcon.isHidden = true
            self.title.textColor = ColorUI.mainText
            self.containerView.layer.shadowOpacity = 0.2
            self.containerView.layer.shadowRadius = 5
            self.containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
            self.containerView.layer.shadowColor = UIColor.black.cgColor
            break
        case .unselected:
            self.notifIcon.isHidden = true
            self.title.textColor = ColorUI.grayText
            self.containerView.backgroundColor = ColorUI.clear
            self.containerView.layer.borderWidth = 1.0
            self.containerView.layer.borderColor = ColorUI.grayBorder.cgColor
            
            break
        case .unavailable:
            self.notifIcon.isHidden = false
            self.title.textColor = ColorUI.mainTheme
            self.containerView.backgroundColor = ColorUI.mainTheme.withAlphaComponent(0.3)
            break
        }
        
    }

}
