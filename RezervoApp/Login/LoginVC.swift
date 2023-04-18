//
//  LoginVCViewController.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 06.03.23.
//

import UIKit

enum LoginType {
    case withPhone
    case withEmail
}

class LoginVC: UIViewController {
    
    var type: LoginType? = .withPhone

    @IBOutlet weak var continueBtn: CustomButton! {
        didSet {
            continueBtn.type = .highImportance
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
            continueBtn.addGestureRecognizer(gesture)
        }
    }
    @IBOutlet weak var changeTypeLbl: UILabel! {
        didSet {
            changeTypeLbl.isUserInteractionEnabled = true
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
            changeTypeLbl.addGestureRecognizer(gesture)
        }
    }
    @IBOutlet weak var field: InputView! {
        didSet {
            field.type = .phone
        }
    }
    
    @objc private func didTap(_ sender: UITapGestureRecognizer){
        switch sender.view{
        case changeTypeLbl:
            if type == .withPhone {
                type = .withEmail
                field.type = .email
                changeTypeLbl.text = "Use email instead"
                print("Use email instead")
            } else if type == .withEmail {
                type = .withPhone
                field.type = .phone
                print("Login with phone number")
                changeTypeLbl.text = "Login with phone number"

            }
        case continueBtn:
            let storyboard = UIStoryboard(name: "Login", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "OTPVC") as! OTPVC
            vc.type = type
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        default:
            break
        }
    }
    
    
    @IBOutlet weak var loginTitleLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
