//
//  loginProtocol.swift
//  login
//
//  Created by Sachin kumar Singh on 01/03/22.
//

import Foundation

protocol loginDelegate:AnyObject{
    //this will return the user name when the user has successfully logged in.
    func didUserLoggedIn(_ name:String )
}
