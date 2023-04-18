//
//  BaseTextField.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 06.03.23.
//

import UIKit

protocol BaseTextFieldDelegate: AnyObject {
    func textFieldDidDelete()
}
class BaseTextField: UITextField {

    weak var myDelegate: BaseTextFieldDelegate?

    override func deleteBackward() {
        super.deleteBackward()
        myDelegate?.textFieldDidDelete()
    }

}
