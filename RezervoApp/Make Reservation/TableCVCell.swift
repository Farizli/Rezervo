//
//  TableCVCell.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 16.04.23.
//

import UIKit

class TableCVCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 15
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setupCell(title: String, type: SelectionState) {
        self.title.text = title
        
        switch type {
        case .unselected:
            self.containerView.backgroundColor = ColorUI.clear
            self.title.textColor = ColorUI.grayText
            break
        case .selected:
            self.title.textColor = ColorUI.mainText
            self.containerView.layer.shadowOpacity = 0.2
            self.containerView.layer.shadowRadius = 5
            self.containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
            self.containerView.layer.shadowColor = UIColor.black.cgColor
            break
        default:
            break
        }
    }

}
