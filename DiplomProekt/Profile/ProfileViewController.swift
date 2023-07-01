//
//  ProfileViewController.swift
//  Navigation
//
//  Created by 마리나 on 13.05.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //MARK: - Private properties
    
    private var avatarImageView: UIImageView!
    
    // MARK: - Constants
    
    private let headerHeight: CGFloat = 200
    private let photosCellHeight: CGFloat = 150
    
    // MARK: -
    var profileHeaderView = ProfileHeaderView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(profileHeaderView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        profileHeaderView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)

        
    }
    
    
}
