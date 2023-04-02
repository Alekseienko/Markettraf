//
//  SpeedTestView.swift
//  Markettraf
//
//  Created by alekseienko on 01.04.2023.
//

import UIKit

class SpeedTestView: UIView {
    
    var resaultView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configuration

extension SpeedTestView {
    
    private func config() {
        self.addGradient()
        self.setBackgroundLines()
        self.setResultView()
        self.setResaultLabel()
        self.setLinesStackView()
        self.setSpeedView()
    }
    
    private func setBackgroundLines() {
        let rect = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        let imgView = UIImageView(frame: rect)
        self.addSubview(imgView)
        imgView.image = UIImage(named: "background-lines")
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
    }
    
    private func setResultView() {
        let rect = CGRect(x: .zero , y:  self.frame.height * 0.63, width: self.frame.width * 0.94, height: self.frame.width * 0.61)
        resaultView = UIView(frame: rect)
        resaultView.backgroundColor = UIColor.white
        resaultView.layer.cornerRadius = 20
        resaultView.center.x = self.center.x
        self.addSubview(resaultView)
    }
    
    private func setResaultLabel() {
        let rect = CGRect(x: self.frame.width * 0.09, y:  self.frame.width * 0.03, width: self.frame.width * 0.2, height: self.frame.width * 0.07)
        let label = UILabel(frame: rect)
        label.textColor = UIColor(red: 0.294, green: 0.314, blue: 0.675, alpha: 1)
        label.font = UIFont(name: "Roboto-Regular", size: self.frame.width * 0.06)
        label.textAlignment = .left
        label.text = "Result:"
        self.resaultView.addSubview(label)
    }
    
    private func setLine(property: String, data: String) -> UIStackView {
        let propertylabel = UILabel()
        propertylabel.text = property
        propertylabel.font = UIFont(name: "Roboto-Regular", size: self.frame.width * 0.03)
        propertylabel.textAlignment = .left
        propertylabel.textColor = UIColor(red: 0.387, green: 0.387, blue: 0.387, alpha: 1)
        
        let datalabel = UILabel()
        datalabel.text = data
        datalabel.font =  UIFont(name: "Roboto-Regular", size: self.frame.width * 0.03)
        datalabel.textAlignment = .right
        datalabel.textColor = UIColor(red: 0.294, green: 0.314, blue: 0.675, alpha: 1)
        let stackView = UIStackView(arrangedSubviews: [propertylabel,datalabel])
        return stackView
    }
    
    private func setLinesStackView(){
        let stackView = UIStackView(arrangedSubviews: [setLine(property: "Download:", data: "25.3Mbps"),
                                                       setLine(property: "Upload:", data: "5.3Mbps"),
                                                       setLine(property: "Ping:", data: "120ms"),
                                                       setLine(property: "Connect type:", data: "Mobile Network"),
                                                       setLine(property: "Ip-adress:", data: "168.0.0.1"),
                                                       setLine(property: "Provider:", data: "Life")])
        stackView.alignment = .fill
        stackView.distribution = .equalSpacing
        stackView.axis = .vertical
        stackView.frame = CGRect(x: self.frame.width * 0.09, y: self.frame.width * 0.15, width: self.frame.width * 0.76, height: self.frame.width * 0.38)
        self.resaultView.addSubview(stackView)
    }
    
    private func setSpeedView() {
        let view = SpeedView()
        view.center.x = self.center.x
        view.frame.origin.y = self.frame.width * 0.32
        self.addSubview(view)
    }
}
