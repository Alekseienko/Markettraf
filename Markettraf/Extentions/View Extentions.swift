//
//  View Extentions.swift
//  Markettraf
//
//  Created by alekseienko on 30.03.2023.
//

import UIKit


extension UIView {
    
     func addGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
          UIColor(red: 0.451, green: 0.459, blue: 0.847, alpha: 1).cgColor,
          UIColor(red: 0.396, green: 0.42, blue: 0.733, alpha: 1).cgColor,
          UIColor(red: 0.286, green: 0.306, blue: 0.667, alpha: 1).cgColor
        ]
        gradientLayer.locations = [0, 0.38, 1]
        gradientLayer.startPoint = .zero
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.bounds = self.bounds.insetBy(dx: -0.5 * self.bounds.size.width,
                                                   dy: -0.5 * self.bounds.size.height)
        gradientLayer.position = self.center
        self.layer.addSublayer(gradientLayer)
    }
    
     func addDropShadow() {
        self.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 4
        self.layer.shadowOffset = CGSize(width: 0, height: 4)
    }
    
    func addInnerShadow() {
        let innerShadow = CALayer()
        innerShadow.frame = bounds
        let radius = self.layer.cornerRadius
        let path = UIBezierPath(roundedRect: innerShadow.bounds.insetBy(dx: -8, dy: -8), cornerRadius:radius)
        let cutout = UIBezierPath(roundedRect: innerShadow.bounds, cornerRadius:radius).reversing()
        path.append(cutout)
        innerShadow.shadowPath = path.cgPath
        innerShadow.masksToBounds = true
        innerShadow.shadowColor = UIColor.black.cgColor
        innerShadow.shadowOffset = CGSize(width: 0, height: 0)
        innerShadow.shadowOpacity = 1
        innerShadow.shadowRadius = 8
        innerShadow.cornerRadius = self.layer.cornerRadius
        layer.addSublayer(innerShadow)
    }
}

extension UIColor {
    static let mainColor = UIColor(red: 0.294, green: 0.314, blue: 0.675, alpha: 1)
    static let textColor = UIColor(red: 0.294, green: 0.314, blue: 0.675, alpha: 1)
}
