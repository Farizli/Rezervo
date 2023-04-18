//
//  EnterUserInfoVC.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 08.03.23.
//

import UIKit


class EnterUserInfoVC: UIViewController {
    
    var type: LoginType?

    @IBOutlet weak var logInBtn: CustomButton! {
        didSet {
            logInBtn.type = .highImportance
        }
    }
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var backBtn: UIButton! {
        didSet {
            let gesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
            backBtn.addGestureRecognizer(gesture)
        }
    }
    @IBOutlet weak var surnameField: InputView!{
        didSet {
            surnameField.type = .defaultField
            surnameField.placeholder = "Surname"
        }
    }
    @IBOutlet weak var nameField: InputView!{
        didSet {
            nameField.type = .defaultField
            nameField.placeholder = "Name"
        }
    }
    @IBOutlet weak var phoneField: InputView! {
        didSet {
            phoneField.isHidden = type == .withPhone
            phoneField.type = .phone
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @objc private func didTap(_ sender: UITapGestureRecognizer){
        switch sender.view{
        case backBtn:
            self.dismiss(animated: true)
        default:
            break
        }
    }


}
