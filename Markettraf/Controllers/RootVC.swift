//
//  RootVC.swift
//  Markettraf
//
//  Created by alekseienko on 02.04.2023.
//

import UIKit

class RootVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGradient()
        
        let rect = CGRect(x: 0, y: 0, width: 200, height: 50)
        
        let button1 = UIButton(frame: rect)
        button1.setTitle("CleanerVC", for: .normal)
        button1.backgroundColor = UIColor.mainColor
        button1.layer.cornerRadius = 12
        button1.center = self.view.center
        button1.tag = 1
        self.view.addSubview(button1)
        let button2 = UIButton(frame: rect)
        button2.setTitle("SpeedTestVC", for: .normal)
        button2.backgroundColor = UIColor.mainColor
        button2.layer.cornerRadius = 12
        button2.center = self.view.center
        button2.frame.origin.y += 70
        button2.tag = 2
        self.view.addSubview(button2)
        button1.addTarget(self, action: #selector(goToVC), for: .touchUpInside)
        button2.addTarget(self, action: #selector(goToVC), for: .touchUpInside)
    }
    
    @objc func goToVC(sender: UIButton) {
        if sender.tag == 1 {
            let vc = CleanerVC()
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let vc = SpeedTestVC()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
