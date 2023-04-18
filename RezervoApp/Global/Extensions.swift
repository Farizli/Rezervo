//
//  Extensions.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 22.02.23.
//

import Foundation
import UIKit
import SwiftUI


extension Collection{
    subscript (safe index: Index) -> Element?{
        return indices.contains(index) ? self[index] : nil
    }
}
extension UIView{
    @IBInspectable
    var cornerradius: CGFloat{
        get{
            layer.cornerRadius
        }set{
            layer.cornerRadius = newValue
        }
    }
    @IBInspectable
    var borderWidth: CGFloat{
        get{
            layer.borderWidth
        }set{
            layer.borderWidth = newValue
        }
    }
    @IBInspectable
    var borderColor: UIColor{
        get{
            UIColor(cgColor: layer.borderColor ?? UIColor.black.cgColor)
        }
        set{
            layer.borderColor = newValue.cgColor
        }
    }
    func shakeView(duration: CGFloat, repeatCount: Float) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = duration
        animation.repeatCount = repeatCount
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: center.x - 10, y: center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: center.x + 10, y: center.y))
        layer.add(animation, forKey: "position")
    }
}

extension String?{
    var orEmpty: String{
        self ?? ""
    }
    var isNilOrEmpty: Bool {
        self == nil || self == ""
    }
}
extension Double?{
    var orZero: Double{
        self ?? 0.0
    }
}
extension Int?{
    var orZero: Int {
        self ?? 0
    }
}

extension UIView {
    func addRoot(swiftUIView: some View, padding: UIEdgeInsets = .zero){
        subviews.forEach { view in
            view.removeFromSuperview()
        }
        let hosting = UIHostingController(rootView: swiftUIView)
        let view = hosting.view!
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        backgroundColor = .clear
        addSubview(view)
        NSLayoutConstraint.activate([
            view.leftAnchor.constraint(equalTo: leftAnchor, constant: padding.left),
            view.rightAnchor.constraint(equalTo: rightAnchor, constant: -padding.right),
            view.topAnchor.constraint(equalTo: topAnchor, constant: padding.top),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -padding.bottom)
        ])
    }
}

extension UIView {
    func addInnerShadow() {
        let innerShadow = CALayer()
        innerShadow.frame = self.bounds
        let radius = self.frame.size.height/2
        let path = UIBezierPath(roundedRect: innerShadow.bounds.insetBy(dx: -1, dy: -1), cornerRadius:radius)
        let cutout = UIBezierPath(roundedRect: innerShadow.bounds, cornerRadius:radius).reversing()
        layer.cornerRadius = radius
        path.append(cutout)
        innerShadow.shadowPath = path.cgPath
        innerShadow.masksToBounds = true
        // Shadow properties
        innerShadow.shadowColor = UIColor.black.cgColor
        innerShadow.shadowOffset = CGSize(width: 0, height: 3)
        innerShadow.shadowOpacity = 0.7
        innerShadow.shadowRadius = 3
        innerShadow.cornerRadius = self.frame.size.height/2
        
        layer.addSublayer(innerShadow)
    }
}
