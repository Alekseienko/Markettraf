//
//  SpeedView.swift
//  Markettraf
//
//  Created by alekseienko on 01.04.2023.
//

import UIKit

class SpeedView: UIView {
    
    var button: UIButton!
    var buttonLabel: UILabel!
    var isStart = false
    var progressBar: ProgressBar!
    
    init() {
        super.init(frame: .zero)
        self.config()
      
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configuration

extension SpeedView {
    
    private func config() {
        self.setSize()
        self.createProgressBar()
        self.setButton()
        self.setButtonImgView()
        self.setButtonLabel()
    }
    
    private func setSize() {
        let widthDevise = UIScreen.main.fixedCoordinateSpace.bounds.width
        let selfWidth = widthDevise * 0.84
        self.frame = CGRect(x: 0, y: 0, width: selfWidth, height: selfWidth)
    }
    
    private func createProgressBar() {
        progressBar = ProgressBar(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.width))
        progressBar.center.x = self.center.x
        self.addSubview(progressBar)
    }
    
    private func setButton() {
        let size = self.frame.width * 0.44
        self.button = UIButton()
        self.button.frame.size = CGSize(width: size, height: size)
        self.button.center = self.center
        self.button.backgroundColor = UIColor.white
        self.button.layer.cornerRadius = self.button.frame.width / 2
        self.button.addDropShadow()
        self.button.addInnerShadow()
        self.addSubview(self.button)
        self.button.addTarget(self, action: #selector(start), for: .touchUpInside)
    }
    
    @objc func start() {
        isStart.toggle()
        buttonLabel.text = isStart ? "START" : "STOP"
        let value = CGFloat.random(in: 0.0 ... 1.0)
        progressBar.set(strokeEnd: value)
    }
    
    private func setButtonImgView() {

        let img = UIImage(named: "Button-speed-icon")
        let imgView = UIImageView(image: img)
        imgView.contentMode = .scaleAspectFit
        imgView.frame.size = CGSize(width: self.frame.width * 0.15, height: self.frame.width * 0.13)
        imgView.center.x = self.button.frame.width * 0.5
        imgView.center.y = self.button.frame.width * 0.45
        self.button.addSubview(imgView)
    }
    
    private func setButtonLabel() {
        buttonLabel = UILabel()
        buttonLabel.text = "START"
        buttonLabel.textColor = UIColor(red: 0.294, green: 0.314, blue: 0.675, alpha: 1)
        buttonLabel.textAlignment = .center
        buttonLabel.font = UIFont(name: "Roboto-Regular", size: 16)
        buttonLabel.frame.size = CGSize(width: self.button.frame.width * 0.4, height:  self.button.frame.width * 0.11)
        buttonLabel.center.x = self.button.frame.width * 0.5
        buttonLabel.center.y = self.button.frame.width * 0.7
        self.button.addSubview(buttonLabel)
    }
    
    
}
