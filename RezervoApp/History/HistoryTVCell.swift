//
//  HistoryTVCell.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 23.03.23.
//

import UIKit

enum HistoryCellType {
    case search
    case history
}

class HistoryTVCell: UITableViewCell {

    var type: HistoryCellType? = .history
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 15
        }
    }
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var rateIcon: UIImageView!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var discount: UILabel!
    @IBOutlet weak var distance: UILabel!
    @IBOutlet weak var restaurantName: UILabel!
    @IBOutlet weak var photo: UIImageView! {
        didSet {
            photo.layer.cornerRadius = 15
            photo.layer.maskedCorners = [ .layerMinXMaxYCorner, .layerMinXMinYCorner]
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(type: HistoryCellType = .history) {
        switch type {
        case .history:
            cancelBtn.isHidden = false
            timeLbl.isHidden = false
        case .search:
            cancelBtn.isHidden = true
            timeLbl.isHidden = true
        default:
            break
        }
    }
    
}
