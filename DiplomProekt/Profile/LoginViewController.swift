//
//  LoginViewController.swift
//  DiplomProekt
//
//  Created by 마리나 on 19.06.2023.
//

import UIKit

class LoginViewController: UIView {
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let loginView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let logo: UIImageView = {
        let view = UIImageView()
        view.layer.contents = UIImage(named: "logo")?.cgImage
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let stackViewForTextField: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 0.5
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 10
        view.backgroundColor = .systemGray6
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var loginField: UITextField = {
        let login = UITextField()
        login.textColor = .black
        login.placeholder = "email or phone"
        login.indent(size: 10)
        login.isSecureTextEntry = true
        login.autocapitalizationType = .none
        login.font = UIFont(name: "bias_Suga", size: 16)
        login.translatesAutoresizingMaskIntoConstraints = false
        login.tintColor = .colorSet
        login.isSecureTextEntry = false
        
        login.delegate = self
        //        textField.addTarget(self, action: #selector(hideKeyboard), for: .editingDidEndOnExit)
        return login
    }()
    
    private let textDelimeter: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    private lazy var passwordField: UITextField = {
        let password = UITextField()
        password.placeholder = "password"
        password.isSecureTextEntry = true
        password.font = UIFont(name: "agustd", size: 16)
        password.autocapitalizationType = .none
        password.textColor = .black
        password.translatesAutoresizingMaskIntoConstraints = false
        password.indent(size: 10)
        
        password.delegate = self
        //        textField.addTarget(self, action: #selector(hideKeyboard), for: .editingDidEndOnExit)
        return password
    }()
    
    
    
    func depositToAccount () {
        if passwordField.text == nil{
            
            
        }else {
        }
    }
    
    private let logInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        let image = UIImage(named: "blue_pixel") as UIImage?
        button.setBackgroundImage(image, for: .normal)
        button.tintColor = .white
        button.setTitle("Log in", for: .normal)
        button.clipsToBounds = true
        
        switch button.state {
            case .normal      : button.alpha = 1
            case .selected    : button.alpha = 0.8
            case .highlighted : button.alpha = 0.8
            case .disabled    : button.alpha = 0.8
            default: button.alpha = 1
        }
        
        button.addTarget(nil, action: #selector(goToProfileViewController), for: .touchUpInside)
        
        return button
    }()
    
    
    
    //MARK: life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        layout()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    //MARK: functions
    @objc func goToProfileViewController() {
        navigationController?.pushViewController(ProfileViewController(), animated: true)
        
    }
    
    
    private func layout() {
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: safeArea.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor)
        ])
        
        scrollView.addSubview(loginView)
        NSLayoutConstraint.activate([
            loginView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            loginView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            loginView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            loginView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            loginView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])
        
        [logo, stackViewForTextField].forEach { loginView.addSubview($0)}
        NSLayoutConstraint.activate([
            logo.centerXAnchor.constraint(equalTo: loginView.centerXAnchor),
            logo.topAnchor.constraint(equalTo: loginView.topAnchor, constant: 120),
            logo.widthAnchor.constraint(equalToConstant: 100),
            logo.heightAnchor.constraint(equalToConstant: 100),
            
            stackViewForTextField.leadingAnchor.constraint(equalTo: loginView.leadingAnchor, constant: 16),
            stackViewForTextField.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
            stackViewForTextField.trailingAnchor.constraint(equalTo: loginView.trailingAnchor, constant: -16),
            stackViewForTextField.heightAnchor.constraint(equalToConstant: 101),
            stackViewForTextField.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16)
        ])
        
        [loginField, textDelimeter, passwordField].forEach { stackViewForTextField.addSubview($0) }
        NSLayoutConstraint.activate([
            loginField.leadingAnchor.constraint(equalTo: stackViewForTextField.leadingAnchor),
            loginField.topAnchor.constraint(equalTo: stackViewForTextField.topAnchor),
            loginField.trailingAnchor.constraint(equalTo: stackViewForTextField.trailingAnchor),
            loginField.heightAnchor.constraint(equalToConstant: 50),
            
            textDelimeter.leadingAnchor.constraint(equalTo: stackViewForTextField.leadingAnchor),
            textDelimeter.topAnchor.constraint(equalTo: loginField.bottomAnchor),
            textDelimeter.trailingAnchor.constraint(equalTo: stackViewForTextField.trailingAnchor),
            textDelimeter.heightAnchor.constraint(equalToConstant: 1),
            
            passwordField.leadingAnchor.constraint(equalTo: stackViewForTextField.leadingAnchor),
            passwordField.topAnchor.constraint(equalTo: textDelimeter.bottomAnchor),
            passwordField.trailingAnchor.constraint(equalTo: stackViewForTextField.trailingAnchor),
            passwordField.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        scrollView.addSubview(logInButton)
        NSLayoutConstraint.activate([
            logInButton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            logInButton.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            logInButton.heightAnchor.constraint(equalToConstant: 50),
        ])
        
    }
    
    
    
    //MARK: extentions
    extension LoginViewController: UITextFieldDelegate {
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            view.endEditing(true)
        }
    }
}


