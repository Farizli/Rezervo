//
//  OTPView.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 08.03.23.
//

import UIKit

class OTPView: UIView {
        
    @IBOutlet private var fields: [InputView]! {
        didSet{
            fields.forEach { input in
                input.delegate = self
                input.type = .otp
            }
        }
    }
    
    @objc dynamic var text: [String] = Array(repeating: "", count: 4)

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView(){
        let view = Bundle.main.loadNibNamed("OTPView", owner: self)?.first as! UIView
        addSubview(view)
        view.frame = bounds
    }
}


extension OTPView: InputViewDelegate{
    func didCallDelete(owner: InputView) {
        let index = fields.firstIndex(of: owner) ?? 0
        owner.text.removeAll()
        text[index] = ""
        if index == 0{
            self.endEditing(true)
        }else{
            let _ = self.fields[safe: index - 1]?.becomeFirstResponder()
        }
    }
    func shouldChangeSelection(owner: InputView, range: NSRange, string: String) -> Bool {
        
        let index = fields.firstIndex(of: owner) ?? 0
        if string.trimmingCharacters(in: CharacterSet(charactersIn: "0123456789").inverted).count == 4, string.count == 4{
            var otpString = string
            self.fields[0].text = String(describing: otpString.first!)
            text[0] = String(describing: otpString.first!)
            otpString.removeFirst()
            self.fields[1].text = String(describing: otpString.first!)
            text[1] = String(describing: otpString.first!)
            otpString.removeFirst()
            self.fields[2].text = String(describing: otpString.first!)
            text[2] = String(describing: otpString.first!)
            otpString.removeFirst()
            self.fields[3].text = String(describing: otpString.first!)
            text[3] = String(describing: otpString.first!)
        }
        else if string.count == 1{
            text[index] = String(describing: string)
            if owner.text == ""{
                owner.text = String(describing: string)
                if index == self.fields.count - 1{
                    self.endEditing(true)
                }else{
                    let _ = self.fields[index + 1].becomeFirstResponder()
                }
            }else{
                owner.text.removeAll()
                owner.text = String(describing: string)
                if index == self.fields.count - 1{
                    self.endEditing(true)
                }else{
                    let _ = self.fields[index + 1].becomeFirstResponder()
                }
            }
            return false
        }
        return true
    }
}
