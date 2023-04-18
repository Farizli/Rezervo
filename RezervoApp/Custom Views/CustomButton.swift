//
//  CustomButton.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 07.03.23.
//

import UIKit

enum Importance{
    case highImportance
    case defaultImportance
}

class CustomButton: UIButton {
    
    var type: Importance? {
        didSet {
            switch type {
            case .highImportance:
                self.layer.borderWidth = 0
                backgroundColor = ColorUI.mainTheme
                setTitleColor(ColorUI.white, for: .normal)
            case .defaultImportance:
                backgroundColor = ColorUI.white
                self.layer.borderWidth = 1
                self.layer.borderColor = ColorUI.mainTheme.cgColor
                setTitleColor(ColorUI.black, for: .normal)
            default:
                backgroundColor = ColorUI.mainTheme

            }
        }
    }
    var cornerRadius = 25.0

    override var isUserInteractionEnabled: Bool {
        didSet {
            self.alpha = isUserInteractionEnabled == false ? 0.5 : 1
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpView()
    }
    
    private func setUpView() {
        layer.cornerRadius = cornerRadius
        switch type {
        case .highImportance:
            self.layer.borderWidth = 0
            backgroundColor = ColorUI.mainTheme
            setTitleColor(ColorUI.white, for: .normal)
        case .defaultImportance:
            backgroundColor = ColorUI.white
            self.layer.borderWidth = 1
            self.layer.borderColor = ColorUI.mainTheme.cgColor
            setTitleColor(ColorUI.black, for: .normal)
        default:
            backgroundColor = ColorUI.mainTheme

        }
        
    }


}
