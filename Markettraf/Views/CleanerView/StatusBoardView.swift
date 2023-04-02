//
//  StatusBoardView.swift
//  Markettraf
//
//  Created by alekseienko on 01.04.2023.
//

import UIKit

class StatusBoardView: UIView {
    
    private var prersetnLabel: UILabel!
    private var totalMemoryLabel: UILabel!
    private var availableLabel: UILabel!
    private var trashSizeLabel: UILabel!
    
    private var persentCount: Int = 0
    private var totalMemoryCount: Int64 = 0
    private var available: Int64 = 0
    private var trashSize: Int64 = 0
    // промто інт
    init(persentCount: Int, totalMemoryCount: Int64, available: Int64, trashSize: Int64) {
        super.init(frame: .zero)
        self.persentCount = persentCount
        self.totalMemoryCount = totalMemoryCount
        self.available = available
        self.trashSize = trashSize
        self.config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configuration

extension StatusBoardView {
    
    private func config() {
        self.setSize()
        self.backgroundColor = UIColor.white.withAlphaComponent(0.15)
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.setYourStorageLabel()
        self.setPrersetnLabelLabel()
        self.setStackStatView()
    }
    
    private func setSize() {
        let widthDevise = UIScreen.main.fixedCoordinateSpace.bounds.width
        let selfWidth = widthDevise * 0.53
        self.frame = CGRect(x: 0, y: 0, width: selfWidth, height: selfWidth)
    }
    
    private func setYourStorageLabel() {
        let label = UILabel()
        label.text = "Your Storage"
        let font = UIFont(name: "Roboto-Regular", size: self.frame.width * 0.09)
        label.font = font
        label.textColor = UIColor.white
        self.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.width * 0.1).isActive = true
    }
    
    private func setPrersetnLabelLabel() {
        self.prersetnLabel = UILabel()
        self.prersetnLabel.text = "\(self.persentCount)%"
        let font = UIFont(name: "Roboto-Regular", size: self.frame.width * 0.28)
        self.prersetnLabel.font = font
        self.prersetnLabel.textColor = UIColor.white
        
        self.addSubview(self.prersetnLabel)
        self.prersetnLabel.translatesAutoresizingMaskIntoConstraints = false
        self.prersetnLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        self.prersetnLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.width * 0.25).isActive = true
    }
    
    private func setStatLabelText(_ text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        let font = UIFont(name: "Roboto-Regular", size: self.frame.width * 0.05)
        label.font = font
        label.textAlignment = .right
        label.textColor = UIColor(red: 0.821, green: 0.821, blue: 0.821, alpha: 1)
        return label
    }
    
    private func setStatLabelCount(_ count: Int64) -> UILabel {
        let label = UILabel()
        label.text = count.getStringFormated()
        let font = UIFont(name: "Roboto-Medium", size: self.frame.width * 0.05)
        label.font = font
        label.textAlignment = .left
        label.textColor = UIColor.white
        return label
    }
    
    private func setVericalStackView(viewArray: [UIView]) -> UIStackView {
        let view = UIStackView(arrangedSubviews: viewArray)
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.spacing = self.frame.width * 0.01
        self.addSubview(view)
        return view
    }
    
    private func setStackStatView() {
        let labelArray =  [setStatLabelText("Total memory:"),
                           setStatLabelText("Available:"),
                           setStatLabelText("Trash size:")]
        let labelCountArray =  [setStatLabelCount(self.totalMemoryCount),
                                setStatLabelCount(self.available),
                                setStatLabelCount(self.trashSize)]
        
        let viewsArr = [setVericalStackView(viewArray: labelArray),setVericalStackView(viewArray: labelCountArray)]
        let view = UIStackView(arrangedSubviews: viewsArr)
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.spacing = self.frame.width * 0.03
        self.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.width * 0.58).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: self.frame.width * -0.16).isActive = true
    }
}
