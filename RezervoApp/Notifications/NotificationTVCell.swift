//
//  NotificationTVCell.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 15.03.23.
//

import UIKit

class NotificationTVCell: UITableViewCell {

    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var note: UILabel!
    @IBOutlet weak var restaurantTitle: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var redDot: UIView! {
        didSet {
            redDot.layer.cornerRadius = 6.0
        }
    }
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.cornerRadius = 25.0
            containerView.layer.shadowOpacity = 0.2
            containerView.layer.shadowRadius = 5
            containerView.layer.shadowOffset = CGSize(width: 0, height: 2)
            containerView.layer.shadowColor = UIColor.black.cgColor
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    
    func setupCell(photo: UIImage, note: String, status: String, title: String, isNew: Bool) {
        self.photo.image =  photo
        self.status.text = status
        self.note.text = note
        self.redDot.isHidden = !isNew
        self.restaurantTitle.text = title
    }
}
