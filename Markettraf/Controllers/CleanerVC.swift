//
//  CleanerVC.swift
//  Markettraf
//
//  Created by alekseienko on 30.03.2023.
//

import UIKit

class CleanerVC: UIViewController {
    

}

// MARK: - Life Circle

extension CleanerVC {
    
    override func loadView() {
        super.loadView()
        self.view = CleanerView(frame: self.view.bounds)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setNavbar()
    }
}

// MARK: -  UI Configuration

extension CleanerVC {
    
    private func setNavbar() {
        let img = UIImage(named: "backButton")
        let backButton = UIBarButtonItem(image: img, style: .done, target: self, action: #selector(backButtonPressed))
        backButton.tintColor = UIColor.white
        self.navigationItem.leftBarButtonItem = backButton
        
        let logoImg = UIImage(named: "Cleaner Logo")
        let logoImageView = UIImageView(image: logoImg)
        let label = UILabel()
        label.text = "Cleaner".uppercased()
        label.textColor = UIColor.white
        label.font = UIFont(name: "Roboto-Medium", size: 14)
        let stackView = UIStackView(arrangedSubviews: [logoImageView,label])
        stackView.spacing = 3
        let logoView = UIBarButtonItem(customView: stackView)
        self.navigationItem.rightBarButtonItem = logoView
    }
    
    @objc private func backButtonPressed() {
        print(#function)
    }
}
