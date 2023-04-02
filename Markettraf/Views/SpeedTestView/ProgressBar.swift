//
//  ProgressBar.swift
//  Markettraf
//
//  Created by alekseienko on 02.04.2023.
//

import UIKit

class ProgressBar: UIView {
    
    private var backgroundLayer: CAShapeLayer!
    private var foregroundLayer: CAShapeLayer!
    private var arrowControl: UIView!
    
    private let startAngle =  7 * -CGFloat.pi / 6
    private let endAngle = 11 * -CGFloat.pi / 6
    
    private var centerProgressBar: CGPoint {
        return CGPoint(x: self.frame.width/2, y:  self.frame.height/2)
    }
    private var radiusProgressBar: CGFloat {
        return (min(self.frame.width, self.frame.height) - lineWidth) / 2
    }
    private var lineWidth: CGFloat {
        return 0.04 * self.frame.width
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setArrowControl()
        createSpeedNumbers()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let backgroundPath = UIBezierPath(arcCenter: centerProgressBar, radius: radiusProgressBar, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        backgroundLayer = CAShapeLayer()
        backgroundLayer.path = backgroundPath.cgPath
        backgroundLayer.strokeColor = UIColor.white.cgColor
        backgroundLayer.fillColor = UIColor.clear.cgColor
        backgroundLayer.lineWidth = lineWidth
        backgroundLayer.lineCap = .round
        layer.addSublayer(backgroundLayer)
        foregroundLayer = CAShapeLayer()
        foregroundLayer.path = backgroundPath.cgPath
        foregroundLayer.strokeColor = UIColor(red: 0.294, green: 0.314, blue: 0.675, alpha: 1).cgColor
        foregroundLayer.fillColor = UIColor.clear.cgColor
        foregroundLayer.lineWidth = lineWidth
        foregroundLayer.lineCap = .round
        foregroundLayer.shadowColor = UIColor(red: 0.401, green: 0.431, blue: 0.988, alpha: 1).cgColor
        foregroundLayer.shadowOpacity = 1
        foregroundLayer.shadowRadius = 18
        foregroundLayer.shadowOffset = CGSize(width: 0, height: 0)
        foregroundLayer.strokeEnd = 0.0
        layer.addSublayer(foregroundLayer)
    }
    
    private func setArrowControl() {
        arrowControl = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        arrowControl.center = CGPoint(x: self.frame.width/2, y: self.frame.height/2)
        self.addSubview(arrowControl)
        let img  = UIImage(named: "Speed Arrow")
        let arrow = UIImageView(image: img)
        arrow.frame.size = CGSize(width: self.frame.width * 0.25, height: self.frame.width * 0.05)
        arrow.center = CGPoint(x: arrowControl.frame.width * 1.3, y: arrowControl.frame.height/2)
        arrowControl.addSubview(arrow)
        arrowControl.transform = CGAffineTransform(rotationAngle: startAngle)
    }
    
    
}

// MARK: - Set value progress bar

extension ProgressBar {
    
    func set(strokeEnd: CGFloat) {
        foregroundLayer.strokeEnd = strokeEnd
        self.setNeedsLayout()
        let differenseAngles = startAngle - endAngle
        let trueDifferenseAngles = CGFloat.pi * 2 - differenseAngles
        let finalAngle = startAngle + abs(trueDifferenseAngles) * strokeEnd
        UIView.animate(withDuration: 0.5) {
            self.arrowControl.transform = CGAffineTransform(rotationAngle: finalAngle)
        }
        
    }
}

// MARK: - Create Speed Numbers

extension ProgressBar {
    
    private func createSpeedNumbers() {
        let numbers = [0, 1, 5, 10, 20, 30, 50, 75, 100]
        let differenseAngles = startAngle - endAngle
        let trueDifferenseAngles = CGFloat.pi * 2 - differenseAngles

        let angleIncrement = abs(trueDifferenseAngles) / CGFloat(numbers.count - 1)
        var angle = startAngle
        let radius = radiusProgressBar * 0.8
        for number in numbers {
            let label = createSpeedNumbers(number: number)
            let x = cos(angle) * radius + centerProgressBar.x
            let y = sin(angle) * radius + centerProgressBar.y
            label.center = CGPoint(x: x, y: y)
            angle += angleIncrement
        }

    }
    
    private func createSpeedNumbers(number: Int) -> UILabel {
        let label = UILabel()
        label.text = String(number)
        label.font = UIFont(name: "Roboto-Regular", size: self.frame.width * 0.03)
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.frame.size = CGSize(width: label.font.pointSize * 2, height: label.font.pointSize)
        self.addSubview(label)
        return label
    }
}
