//
//  onboardingDelegate.swift
//  login
//
//  Created by Sachin kumar Singh on 01/03/22.
//

import Foundation
protocol onboardingDelegate:AnyObject{
    //this will return the user name when the user has successfully logged in.
    func didUserOnboarded()
}
