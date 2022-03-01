//
//  AppDelegate.swift
//  login
//
//  Created by Sachin kumar Singh on 28/02/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate{
 
    
    var window: UIWindow?
    let loginview=LoginViewController()  //delegate class initilization
    let onboardingview=OnboardingContainerViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey:Any]?)->Bool{
        window=UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.backgroundColor = .systemBackground
        window?.rootViewController = loginview

        loginview.delegate=self
        onboardingview.delegate=self
        return true
    }

}

// MARK: login succesfull
extension AppDelegate:loginDelegate{
    func didUserLoggedIn(_ name: String) {
        print("logged in \(name)")
        setRootViewController(onboardingview)

    }
}

extension AppDelegate:onboardingDelegate{
    func didUserOnboarded() {
     print("onboarded")
    }
}

extension AppDelegate{
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }

        window.rootViewController = vc
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                          duration: 0.5,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}

