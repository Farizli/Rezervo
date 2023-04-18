//
//  CalendarCVCell.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 16.04.23.
//

import UIKit

enum SelectionState {
    case selected
    case unavailable
    case unselected
}


class CalendarCVCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 15
        }
    }
    @IBOutlet weak var dayNameLbl: UILabel!
    @IBOutlet weak var dayNumberLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func setupCell(type: SelectionState, dayName: String, dayNumber: String) {
        
        self.dayNameLbl.text = dayName
        self.dayNumberLbl.text = dayNumber
        
        switch type {
        case .selected:
            self.dayNameLbl.textColor = ColorUI.mainText
            self.dayNumberLbl.textColor = ColorUI.mainText
            self.containerView.layer.shadowOpacity = 0.2
            self.containerView.layer.shadowRadius = 5
            self.containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
            self.containerView.layer.shadowColor = UIColor.black.cgColor
           break
        case .unavailable:
            self.dayNameLbl.textColor = ColorUI.mainTheme
            self.dayNumberLbl.textColor = ColorUI.mainTheme
            self.containerView.backgroundColor = ColorUI.mainTheme.withAlphaComponent(0.3)
            break
        case .unselected:
            self.dayNameLbl.textColor = ColorUI.grayText
            self.dayNumberLbl.textColor = ColorUI.grayText
            self.containerView.backgroundColor = ColorUI.clear
            break
        }
        
        
        
    }

}
