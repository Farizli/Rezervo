//
//  ProfileVC.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 15.03.23.
//

import UIKit

class ProfileVC: UIViewController {
    
    var dummyData: [(icon: UIImage, title: String, hasSwitch: Bool)] = [
        (ImageUI.setLocation, "Location", false),
        (ImageUI.setNotif, "Notifications", true),
        (ImageUI.setDarkLight, "Dark theme", true),
        (ImageUI.setScores, "Scores", false),
        (ImageUI.setSupport, "Support", false),
        (ImageUI.setAbout, "About", false),
        (ImageUI.setPrivacy, "Privacy", false),
        (ImageUI.setLogout, "Log out", false),
        (ImageUI.setDeleteAccount, "Delete account", false)
    ]
    @IBOutlet weak var circleView: UIView! {
        didSet {
            circleView.layer.cornerRadius = circleView.frame.height / 2
            circleView.layer.shadowOpacity = 0.2
            circleView.layer.shadowRadius = 5
            circleView.layer.shadowOffset = CGSize(width: 0, height: 2)
            circleView.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        }
    }
    
    @IBOutlet weak var profileTVHeight: NSLayoutConstraint!
    @IBOutlet weak var profileTV: UITableView! {
        didSet {
            profileTV.layer.borderWidth = 1
            profileTV.layer.borderColor = ColorUI.grayText.withAlphaComponent(0.3).cgColor
            profileTV.layer.cornerRadius = 10
            profileTV.delegate = self
            profileTV.dataSource = self
        }
    }
    @IBOutlet weak var editProfileView: UIView!
    {
        didSet {
            editProfileView.layer.cornerRadius = editProfileView.frame.height / 2
            editProfileView.layer.shadowOpacity = 0.2
            editProfileView.layer.shadowRadius = 5
            editProfileView.layer.shadowOffset = CGSize(width: 0, height: 2)
            editProfileView.layer.shadowColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var profilePic: UIImageView! {
        didSet {
            profilePic.layer.cornerRadius = 45
            profilePic.layer.shadowOpacity = 0.2
            profilePic.layer.shadowRadius = 5
            profilePic.layer.shadowOffset = CGSize(width: 0, height: 2)
            profilePic.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor

        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.layoutIfNeeded()
        profileTVHeight.constant = profileTV.contentSize.height
    }
    

}

extension ProfileVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dummyData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileTVCell", for: indexPath) as! ProfileTVCell
        cell.setupCell(hasDashline: indexPath.row < dummyData.count - 1 ? true : false, title: dummyData[indexPath.row].title, icon: dummyData[indexPath.row].icon, hasSwitch: dummyData[indexPath.row].hasSwitch)
        
        return cell
    }
    
    
}
