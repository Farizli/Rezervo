//
//  CustomSearchView.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 14.03.23.
//

import UIKit
import Combine

enum SearchViewType {
    case map
    case search
    case defaultSearch
}
protocol CustomSearchViewDelegate: AnyObject{
    func shouldChangeSelection(owner: CustomSearchView, range: NSRange, string: String) -> Bool
    func didChangeSelection(owner: CustomSearchView,string: String)
    func didCallDelete(owner: CustomSearchView)
    func didBeginEditing(owner: CustomSearchView)
    func shouldBeginEditing(owner: CustomSearchView) -> Bool
    func didEndEditing(owner: CustomSearchView)

}
extension CustomSearchViewDelegate{
    func shouldChangeSelection(owner: CustomSearchView, range: NSRange, string: String) -> Bool{true}
    func didChangeSelection(owner: CustomSearchView,string: String){}
    func didCallDelete(owner: CustomSearchView){}
    func didBeginEditing(owner: CustomSearchView){}
    func shouldBeginEditing(owner: CustomSearchView) -> Bool {true}
    func didEndEditing(owner: CustomSearchView){}
}


@IBDesignable
class CustomSearchView: UIView {
    weak var delegate: CustomSearchViewDelegate?
    var cancelables = Set<AnyCancellable>()
    var cornerRadius = 10.0
    var type: SearchViewType? {
        didSet {
            switch type {
            case .map:
                searchIcon.isHidden = false
                mapBtn.isHidden = false
                textField.isSecureTextEntry = false

            case .search:
                break
                
            case .defaultSearch:
                searchIcon.isHidden = true
                mapBtn.isHidden = true
                textField.isSecureTextEntry = false

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
            mapBtn.image(for: .normal) ?? UIImage()
        }set{
            mapBtn.setImage(newValue, for: .normal)
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override func becomeFirstResponder() -> Bool {
        super.becomeFirstResponder()
        return textField.becomeFirstResponder()
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
        let view = Bundle.main.loadNibNamed("CustomSearchView", owner: self)!.first as! UIView
        view.frame = bounds
        view.layer.cornerRadius = cornerRadius
        containerView.layer.cornerRadius = cornerRadius
        addSubview(view)
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTap))
        gesture.cancelsTouchesInView = false
        addGestureRecognizer(gesture)
        textField.publisher(for: \.text, options: .initial)
            .sink { text in
                if !text.isNilOrEmpty {
                    switch self.type {
                    case .defaultSearch:
                        self.mapBtn.isHidden = true
                        self.searchIcon.isHidden = true
                    default:
                        self.mapBtn.isHidden = true
                        self.searchIcon.isHidden = true
                    }
                }
            }.store(in: &cancelables)
        self.addInnerShadow()

    }
    
    
    @IBOutlet weak var textField: BaseTextField!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var searchIcon: UIImageView!
    @IBOutlet weak var mapBtn: UIButton!
}

extension CustomSearchView: BaseTextFieldDelegate{
    func textFieldDidDelete() {
        delegate?.didCallDelete(owner: self)
    }
}

extension CustomSearchView: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return delegate?.shouldChangeSelection(owner: self, range: range, string: string) ?? true
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
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
