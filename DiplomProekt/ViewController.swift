//
//  ViewController.swift
//  DiplomProekt
//
//  Created by 마리나 on 15.06.2023.
//

import UIKit

class ViewController: UIViewController {

    private lazy var actionButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints  = false
        button.setTitle("Перейти", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


