//
//  LoginView.swift
//  login
//
//  Created by Sachin kumar Singh on 28/02/22.
//

import Foundation
import UIKit

class LoginView: UIView{
    let stackview=UIStackView()
    let username=UITextField()
    let password=UITextField()
    let divider=UIView()
    override init(frame: CGRect){
        super.init(frame: frame)
        //method to style he view
        style()
        //method to set layout of view
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
}

extension LoginView{
    func style(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .systemGray5
        
        stackview.translatesAutoresizingMaskIntoConstraints=false
        stackview.axis = .vertical
        stackview.spacing=8
//        stackview.backgroundColor = .tertiarySystemFill
        //text fields
        username.translatesAutoresizingMaskIntoConstraints=false
        username.placeholder="enter  user name"
        username.delegate=self
//        username.backgroundColor = .systemGray
        password.translatesAutoresizingMaskIntoConstraints=false
        password.placeholder="enter your password"
        password.isSecureTextEntry=true
        password.delegate=self
        
        divider.translatesAutoresizingMaskIntoConstraints=false
        divider.backgroundColor = .secondarySystemFill
        
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    func layout(){
        stackview.addArrangedSubview(username)
        stackview.addArrangedSubview(divider)
        stackview.addArrangedSubview(password)

        addSubview(stackview)
        
        NSLayoutConstraint.activate([
            stackview.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackview.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            self.trailingAnchor.constraint(equalToSystemSpacingAfter: stackview.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackview.bottomAnchor, multiplier: 1),
            //divider
            divider.heightAnchor.constraint(equalToConstant: 1)
        ])
        
     
  
    }
}

//MARK: text field delegates
extension LoginView:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        username.endEditing(true)
        password.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
       return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
    }
}
