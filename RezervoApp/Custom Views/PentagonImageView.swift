//
//  PentagonImageView.swift
//  RezervoApp
//
//  Created by Ali  Farizli  on 15.03.23.
//

import UIKit

class PentagonImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.mask = createPentagonMask()
    }
    
    private func createPentagonMask() -> CAShapeLayer {
        let maskLayer = CAShapeLayer()
        let maskPath = UIBezierPath()
        let height = self.bounds.height
        let width = self.bounds.width
        
        maskPath.move(to: CGPoint(x: width / 2.0, y: 0.0))
        maskPath.addLine(to: CGPoint(x: width, y: height * 0.3))
        maskPath.addLine(to: CGPoint(x: width * 0.8, y: height))
        maskPath.addLine(to: CGPoint(x: width * 0.2, y: height))
        maskPath.addLine(to: CGPoint(x: 0.0, y: height * 0.3))
        maskPath.close()
        
        maskLayer.path = maskPath.cgPath
        maskLayer.cornerRadius = 10.0
        return maskLayer
    }
}
