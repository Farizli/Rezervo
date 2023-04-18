//
//  InputView.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 06.03.23.
//

import UIKit
import Combine

enum FieldType{
    case phone
    case otp
    case dropDown
    case email
    case defaultField
}

protocol InputViewDelegate: AnyObject{
    func shouldChangeSelection(owner: InputView, range: NSRange, string: String) -> Bool
    func didChangeSelection(owner: InputView,string: String)
    func didCallDelete(owner: InputView)
    func didBeginEditing(owner: InputView)
    func shouldBeginEditing(owner: InputView) -> Bool
    func didEndEditing(owner: InputView)

}
extension InputViewDelegate{
    func shouldChangeSelection(owner: InputView, range: NSRange, string: String) -> Bool{true}
    func didChangeSelection(owner: InputView,string: String){}
    func didCallDelete(owner: InputView){}
    func didBeginEditing(owner: InputView){}
    func shouldBeginEditing(owner: InputView) -> Bool {true}
    func didEndEditing(owner: InputView){}
}

@IBDesignable
class InputView: UIView {
    weak var delegate: InputViewDelegate?
    var cancelables = Set<AnyCancellable>()
    var cornerRadius = 10.0
    var type: FieldType?{
        didSet {
            switch type {
            case .phone:
                indexBtn.isHidden = false
                indexBtn.setTitle("🇦🇿 +994", for: .normal)
                splitView.isHidden = false
                textField.placeholder = "Mobile number"
                textField.keyboardType = .phonePad
                textField.textContentType = .telephoneNumber
                textField.isSecureTextEntry = false
                textField.isUserInteractionEnabled = true
            case .otp:
                indexBtn.isHidden = true
                splitView.isHidden = true
                textField.placeholder = ""
                textField.textAlignment = .center
                textField.keyboardType = .numberPad
                textField.textContentType = .oneTimeCode
                textField.isSecureTextEntry = false
                textField.isUserInteractionEnabled = true
                break
            case .email:
                indexBtn.isHidden = true
                indexBtn.isUserInteractionEnabled = false
//              SET INDEXBTN IMAGE HERE
                indexBtn.setTitle("", for: .normal)
                splitView.isHidden = true
                textField.placeholder = "Email"
                textField.keyboardType = .emailAddress
                textField.textContentType = .emailAddress
                textField.isSecureTextEntry = false
                textField.isUserInteractionEnabled = true
                break
            case .defaultField:
                indexBtn.isHidden = true
                splitView.isHidden = true
                textField.keyboardType = .default
                textField.textContentType = .none
                textField.isSecureTextEntry = false
                textField.isUserInteractionEnabled = true
                break
            default:
                break
            }
        }
    }
    
    @IBInspectable
    var text: String{
        get{
            textField.text.orEmpty
        }
        set{
            textField.text = newValue
        }
    }
    @IBInspectable
    var placeholder: String{
        get{
            textField.placeholder.orEmpty
        }
        set{
            textField.placeholder = newValue
        }
    }
    @IBInspectable
    var image: UIImage{
        get{
            indexBtn.image(for: .normal) ?? UIImage()
        }set{
            indexBtn.setImage(newValue, for: .normal)
        }
    }
    @IBInspectable
    var indexText: String{
        get{
            indexBtn.title(for: .normal) ?? "+994"
        }set{
            indexBtn.setTitle(newValue, for: .normal)
        }
    }

    
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var splitView: UIView!
    @IBOutlet weak var indexBtn: UIButton!
    @IBOutlet weak var textField: BaseTextField!{
        didSet {
            textField.delegate = self
            textField.myDelegate = self
        }
    }
    
    override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        return textField.becomeFirstResponder()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    @objc private func didTap(_ sender: UITapGestureRecognizer){
        switch sender.view{
        case self:
            textField.becomeFirstResponder()
            
        default:
            break
        }
    }
    private func setupView(){
        let view = Bundle.main.loadNibNamed("InputView", owner: self)!.first as! UIView
        view.frame = bounds
        view.layer.cornerRadius = cornerRadius
        contentView.layer.cornerRadius = cornerRadius
        self.contentView.layer.borderWidth = 1
        self.contentView.layer.borderColor = ColorUI.grayText.withAlphaComponent(0.15).cgColor
        addSubview(view)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        gesture.cancelsTouchesInView = false
        addGestureRecognizer(gesture)
        textField.publisher(for: \.text, options: .initial)
            .sink { text in
                if !text.isNilOrEmpty {
                    switch self.type {
                    case .phone:
                        self.indexBtn.isHidden = false
                    default:
                        self.indexBtn.isHidden = true
                    }
                    self.contentView.layer.borderWidth = 1
                    self.contentView.layer.borderColor = ColorUI.grayText.withAlphaComponent(0.15).cgColor
                    self.layoutIfNeeded()
                }
            }.store(in: &cancelables)
    }
    

}

extension InputView: BaseTextFieldDelegate{
    func textFieldDidDelete() {
        delegate?.didCallDelete(owner: self)
    }
}
extension InputView: UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let newString = (textField.text as? NSString)?.replacingCharacters(in: range, with: string)
        switch self.type {
        case .phone:
            return true
        default:
            break
        }
        return delegate?.shouldChangeSelection(owner: self, range: range, string: string) ?? true
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.transition(with: self, duration: 0.2) {
//            switch self.type {
//            case .phone:
//                self.indexLabel.isHidden = false
//                self.textfield.placeholder = "XX XXX XX XX"
//            default:
//                self.indexLabel.isHidden = true
//            }
            self.layoutIfNeeded()
        }
        delegate?.didBeginEditing(owner: self)
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.didEndEditing(owner: self)
        endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
    }
}
