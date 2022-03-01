//
//  ViewController.swift
//  login
//
//  Created by Sachin kumar Singh on 28/02/22.
//

import UIKit
import SwiftUI



class LoginViewController: UIViewController {
    let loginView = LoginView()
    let loginButton=UIButton(type:.system)
    let errorLabel=UILabel()
    var isLoginFailed=true
    weak var delegate: loginDelegate?
    var username:String?{
        return loginView.username.text
    }
    
    var password:String?{
        return loginView.password.text
    }
    var errorMsg="Invalid username or password"
      override func viewDidLoad() {
          super.viewDidLoad()
     
          style()
          layout()
      }
    
}

extension LoginViewController {
      private func style() {
          
          loginView.translatesAutoresizingMaskIntoConstraints = false
          
          //loginbutton
          loginButton.translatesAutoresizingMaskIntoConstraints = false
          loginButton.configuration = .filled()
          loginButton.configuration?.imagePadding=8
          loginButton.setTitle("LogIN", for: [])
          loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .primaryActionTriggered)
          
          //label
          errorLabel.translatesAutoresizingMaskIntoConstraints=false
          errorLabel.textColor = .systemRed
          errorLabel.textAlignment = .center
          errorLabel.numberOfLines = 0
          errorLabel.isHidden = isLoginFailed
          errorLabel.text=errorMsg
      }
      
      private func layout() {
          view.addSubview(loginView)
          view.addSubview(loginButton)
          view.addSubview(errorLabel)
          
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
             view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1),
                
                    ])
          //login button
          NSLayoutConstraint.activate([
              loginButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
              loginButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
              view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginButton.trailingAnchor, multiplier: 1)
              
          ])
          
          //error label
          NSLayoutConstraint.activate([
            errorLabel.topAnchor.constraint(equalToSystemSpacingBelow: loginButton.bottomAnchor, multiplier: 2),
            errorLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: errorLabel.trailingAnchor, multiplier: 1)
            
          ])

      }
  }


extension LoginViewController{
    
    @objc func loginButtonTapped(sender: UIButton) {
            errorLabel.isHidden = true
            login()
        }
    private func login() {
//        guard let username = username, let password = password else {
//            assertionFailure("Username / password should never be nil")
//            return
//        }
//
//        if username.isEmpty || password.isEmpty {
//            configureView(withMessage: "Username / password cannot be blank")
//            return
//        }
        if username == "" && password == "" {
                  print("Welcome!")
            //this puts that indicator of loading inside the button
                  loginButton.configuration?.showsActivityIndicator = true
            print("delegate fire")
            delegate?.didUserLoggedIn("satrki")
              } else {
                  configureView(withMessage: "Incorrect username / password")
              }
    }
    
    private func configureView(withMessage message: String) {
        errorLabel.isHidden = false
        errorLabel.text = message
    }
}
