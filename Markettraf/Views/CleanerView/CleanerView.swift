//
//  CleanerView.swift
//  Markettraf
//
//  Created by alekseienko on 31.03.2023.
//

import UIKit

class CleanerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configuration

extension CleanerView {
    
    private func config() {
        self.addGradient()
        self.setBackgroundBubles()
        self.setStatusBoardView()
        self.setPhotoButton()
        self.setScreenshotButton()
        self.setContactButton()
        self.setSecretStorageButton()
        self.setAllPhotosButton()
        self.setAllVideosButton()
    }
    
    private func setBackgroundBubles() {
        let rect = CGRect(x: 0,
                          y: self.frame.height * 0.25,
                          width: self.frame.width,
                          height: self.frame.height * 0.75)
        let imgView = UIImageView(frame: rect)
        self.addSubview(imgView)
        imgView.image = UIImage(named: "background-bubbles-circle")
        imgView.contentMode = .scaleAspectFill
        imgView.clipsToBounds = true
    }
    
    private func setStatusBoardView() {
        let board = StatusBoardView(persentCount: 76, totalMemoryCount: 128000000000, available: 6500000000, trashSize: 56000000)
        self.addSubview(board)
        board.center.x = self.center.x
        board.frame.origin.y = self.frame.height * 0.12
    }
    
    
    private func setPhotoButton() {
        let button = ButtonDoubleColors(imageName: "Duplicates photos", infoText: "120 files", dublicateCount: 67)
        self.addSubview(button)
        button.center.x = (self.center.x - button.frame.width / 2) / 2
        button.frame.origin.y = self.frame.height * 0.52
    }
    
    private func setScreenshotButton() {
        let button = ButtonDoubleColors(imageName: "Duplicate screenshots", infoText: "12 files", dublicateCount: 2)
        self.addSubview(button)
        button.center.x = self.center.x
        button.frame.origin.y = self.frame.height * 0.45
    }
    
    private func setContactButton() {
        let button = ButtonDoubleColors(imageName: "Duplicate contacts", infoText: "10 contacts", dublicateCount: 67)
        self.addSubview(button)
        button.center.x = self.frame.width - (self.center.x - button.frame.width / 2) / 2
        button.frame.origin.y = self.frame.height * 0.52
    }
    
    private func setSecretStorageButton() {
        let button = ButtonSingleColor(buttonName: "Secret storage")
        self.addSubview(button)
        button.center.x = self.center.x
        button.frame.origin.y = self.frame.height * 0.63
    }
    
    private func setAllPhotosButton() {
        let button = ButtonSingleColor(buttonName: "All photos")
        self.addSubview(button)
        button.center.x = (self.center.x + button.frame.width * 0.3) / 2
        button.frame.origin.y = self.frame.height * 0.79
    }
    
    private func setAllVideosButton() {
        let button = ButtonSingleColor(buttonName: "All videos")
        self.addSubview(button)
        button.center.x = self.frame.width - (self.center.x + button.frame.width * 0.3) / 2
        button.frame.origin.y = self.frame.height * 0.79
    }
}
