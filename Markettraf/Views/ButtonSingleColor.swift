//
//  ButtonSingleColor.swift
//  Markettraf
//
//  Created by alekseienko on 31.03.2023.
//

import UIKit

class ButtonSingleColor: UIButton {
    
    private var imgView: UIImageView!
    private var nameLabel: UILabel!
    private var buttonName: String!
    
    init(buttonName: String) {
        super.init(frame: .zero)
        self.buttonName = buttonName
        self.config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: -  Configuratoin

extension ButtonSingleColor {
    
    private func config() {
        self.setSize()
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = self.frame.width / 2
        self.addDropShadow()
        self.addInnerShadow()
        self.setImgView()
        self.setNameLabel()
    }
    
    private func setSize() {
        let widthDevise = UIScreen.main.fixedCoordinateSpace.bounds.width
        let selfWidth = widthDevise * 0.3
        self.frame = CGRect(x: 0, y: 0, width: selfWidth, height: selfWidth)
    }
    
    private func setImgView() {
        self.imgView = UIImageView()
        self.imgView.image = UIImage(named: self.buttonName)
        self.imgView.contentMode = .scaleAspectFit
        
        self.addSubview(self.imgView)
        self.imgView.translatesAutoresizingMaskIntoConstraints = false
        self.imgView.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.width * 0.14).isActive = true
        self.imgView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.imgView.widthAnchor.constraint(equalToConstant: self.frame.width * 0.36).isActive = true
        self.imgView.heightAnchor.constraint(equalToConstant: self.frame.width * 0.36).isActive = true
    }
    
    private func setNameLabel() {
        self.nameLabel = UILabel()
        let text = buttonName.replacingOccurrences(of: " ", with: "\n", options: .literal, range: nil)
        self.nameLabel.text = text.uppercased()
        let font = UIFont(name: "Roboto-Regular", size: self.frame.width * 0.11)
        self.nameLabel.font = font
        self.nameLabel.numberOfLines = 0
        self.nameLabel.textAlignment = .center
        self.nameLabel.lineBreakMode = .byTruncatingTail
        self.nameLabel.textColor = UIColor.mainColor
        self.addSubview(self.nameLabel)
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        self.nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.width *  0.59).isActive = true
        self.nameLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
    }
}
