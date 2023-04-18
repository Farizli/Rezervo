//
//  EditProfileVC.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 23.03.23.
//

import UIKit

class EditProfileVC: UIViewController {

    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var saveBtn: CustomButton! {
        didSet {
            saveBtn.type = .highImportance
        }
    }
    @IBOutlet weak var emailField: InputView! {
        didSet {
            emailField.type = .email
            emailField.placeholder = "example@gmail.com"
        }
    }
    @IBOutlet weak var phoneField: InputView!{
        didSet {
            phoneField.type = .phone
            phoneField.placeholder = "99 999 99 99"
        }
    }
    @IBOutlet weak var surnameField: InputView!{
        didSet {
            surnameField.type = .defaultField
            surnameField.placeholder = "Surname"
        }
    }
    @IBOutlet weak var firstNameField: InputView!{
        didSet {
            firstNameField.type = .defaultField
            firstNameField.placeholder = "Your name"
        }
    }
    @IBOutlet weak var editPhotoBtn: UIView! {
        didSet {
            editPhotoBtn.layer.cornerRadius = editPhotoBtn.frame.height / 2
            editPhotoBtn.layer.shadowOpacity = 0.2
            editPhotoBtn.layer.shadowRadius = 5
            editPhotoBtn.layer.shadowOffset = CGSize(width: 0, height: 2)
            editPhotoBtn.layer.shadowColor = UIColor.black.cgColor
        }
    }
    @IBOutlet weak var profileImage: UIImageView! {
        didSet {
            profileImage.layer.cornerRadius = 45
            profileImage.layer.shadowOpacity = 0.2
            profileImage.layer.shadowRadius = 5
            profileImage.layer.shadowOffset = CGSize(width: 0, height: 2)
            profileImage.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor

        }
    }
    @IBOutlet weak var circleView: UIView! {
        didSet {
            circleView.layer.cornerRadius = circleView.frame.height / 2
            circleView.layer.shadowOpacity = 0.2
            circleView.layer.shadowRadius = 5
            circleView.layer.shadowOffset = CGSize(width: 0, height: 2)
            circleView.layer.shadowColor = UIColor.black.withAlphaComponent(0.5).cgColor
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
