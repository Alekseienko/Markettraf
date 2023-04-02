//
//  ButtonDoubleColors.swift
//  Markettraf
//
//  Created by alekseienko on 30.03.2023.
//

import UIKit


class ButtonDoubleColors: UIButton {
    
    private var imgView: UIImageView!
    private var nameLabel: UILabel!
    private var infoLabel: UILabel!
    private var dublicateLabel: UILabel!
    
    private var imageName: String!
    private var infoText: String!
    private var dublicateCount: Int = 0
    
    init(imageName: String, infoText: String, dublicateCount: Int ) {
        super.init(frame: .zero)
        self.imageName = imageName
        self.infoText = infoText
        self.dublicateCount = dublicateCount
        self.config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configuration

extension ButtonDoubleColors {
    
    private func config() {
        self.setSize()
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = self.frame.width / 2
        self.addDropShadow()
        self.addInnerShadow()
        self.drawBottomElement()
        self.setChevronImg()
        self.setNameLabel()
        self.setImgView()
        self.setInfoLabel()
        self.setDublicateLabel()
    }
    
    private func setSize() {
        let widthDevise = UIScreen.main.fixedCoordinateSpace.bounds.width
        let selfWidth = widthDevise * 0.3
        self.frame = CGRect(x: 0, y: 0, width: selfWidth, height: selfWidth)
    }
    
    private func drawBottomElement() {
        let path = UIBezierPath()
        let pStart = CGPoint(x: self.frame.width * 0.2, y: self.frame.height / 2)
        path.move(to: pStart)
        let center = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        path.addArc(withCenter: center,
                    radius: self.frame.width * 0.3,
                    startAngle: .pi,
                    endAngle: (.pi + .pi) + .pi * 0.21, clockwise: false)

        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = UIColor.mainColor.withAlphaComponent(0.77).cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = self.frame.width * 0.4
        
        let viewElement = UIView()
        viewElement.frame = self.bounds
        viewElement.transform = CGAffineTransform(rotationAngle: -.pi * 0.105)
        viewElement.layer.addSublayer(shapeLayer)
        self.addSubview(viewElement)
    }
    
    private func setImgView() {
        self.imgView = UIImageView()
        self.imgView.image = UIImage(named: self.imageName)
        self.imgView.contentMode = .scaleAspectFit
        self.addSubview(self.imgView)
        self.imgView.translatesAutoresizingMaskIntoConstraints = false
        self.imgView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.width * 0.07).isActive = true
        self.imgView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.imgView.widthAnchor.constraint(equalToConstant: self.frame.width * 0.37).isActive = true
        self.imgView.heightAnchor.constraint(equalToConstant: self.frame.width * 0.28).isActive = true
    }
    
    private func setChevronImg() {
        let img = UIImage(systemName: "chevron.down",withConfiguration: UIImage.SymbolConfiguration(pointSize: 10, weight: .regular))?.withRenderingMode(.alwaysTemplate)
        let imgView = UIImageView(image: img)
        imgView.tintColor = UIColor(red: 0.294, green: 0.314, blue: 0.675, alpha: 1)
        self.addSubview(imgView)
        imgView.center.x = self.frame.width / 2
        imgView.frame.origin.y = self.frame.width * 0.5 + self.frame.width * 0.02
    }
    
    private func setNameLabel() {
        self.nameLabel = UILabel()
        self.nameLabel.text = self.imageName
        let font = UIFont(name: "Roboto-Regular", size: self.frame.width * 0.09)
        self.nameLabel.font = font
        self.nameLabel.textAlignment = .center
        self.nameLabel.textColor = UIColor.mainColor
        self.addSubview(nameLabel)
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.width *  0.37).isActive = true
        self.nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    private func setInfoLabel() {
        self.infoLabel = UILabel()
        self.infoLabel.text = self.infoText
        let font = UIFont(name: "Roboto-Medium", size: self.frame.width * 0.11)
        self.infoLabel.font = font
        self.infoLabel.textAlignment = .center
        self.infoLabel.textColor = UIColor.white
        self.addSubview(self.infoLabel)
        self.infoLabel.translatesAutoresizingMaskIntoConstraints = false
        self.infoLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.width * 0.63).isActive = true
        self.infoLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
    
    private func setDublicateLabel() {
        self.dublicateLabel = UILabel()
        self.dublicateLabel.text = "\(self.dublicateCount) duplicate "
        let font = UIFont(name: "Roboto-Regular", size: self.frame.width * 0.07)
        self.dublicateLabel.font = font
        self.dublicateLabel.textAlignment = .center
        self.dublicateLabel.textColor = UIColor(red: 0.246, green: 0.246, blue: 0.246, alpha: 1)
        self.addSubview(self.dublicateLabel)
        self.dublicateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.dublicateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.width * 0.79).isActive = true
        self.dublicateLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}
