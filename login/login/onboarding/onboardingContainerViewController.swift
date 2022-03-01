//
//  onboardingViewController.swift
//  login
//
//  Created by Sachin kumar Singh on 01/03/22.
//

//MARK:  Onbaording (what and How)
/*
 WHAT
 after login we generally presnt various pages and these pages helps the user in understanding how to interact with  the app and what features does app provide
 
 HOW
 for building this we use UIPageViewContoller
 at first we create a normal viewController (let say A) then inside it we create a variable of type UIPageViewController and we will make this as the child of "A".
 then we will create a array of type UIViewConroller and keep our diffrent viewContollers that we want to display on page and based on user interaction we will traverse this array up and down to show diffrent view.
 
 */

import Foundation
import UIKit

class OnboardingContainerViewController: UIViewController {

    let pageViewController: UIPageViewController
    var pages = [UIViewController]()  //array to store views
    var currentVC: UIViewController
    let closeButton=UIButton(type: .close)
    weak var delegate:onboardingDelegate?
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        
        //initilizing  pageviewcontroller variable
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        
        //creating and adding multiple views int view array
        let page1 = page1ViewController(img:pageviewConstant.page1img , text: pageviewConstant.page1text)
        let page2 = page1ViewController(img:pageviewConstant.page2img , text: pageviewConstant.page2text)
        let page3 = page1ViewController(img:pageviewConstant.page3img , text:pageviewConstant.page3text)

        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
   
        
        //setting current view controller
        currentVC = pages.first!
        
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .systemPurple
        
        // MARK: these below 3 lines are crucial
        //adding pageviewcontroller as child of parent
        addChild(pageViewController)
        //view of pageviewcontroller is added as subview of parent
        view.addSubview(pageViewController.view)
        //didmove() helps us linkinkg the lifecycle methods of page view to parent view
        pageViewController.didMove(toParent: self)
        
        
        pageViewController.dataSource = self  //setting datasource delegate
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        //autolayout constraints for pageviews
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
            view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor),
        ])
        
        //setting up the pageviewcontroller
        pageViewController.setViewControllers([pages.first!], direction: .forward, animated: false, completion: nil)
        currentVC = pages.first!
        
        style()
        layout()
    }
    
    private func style() {
         closeButton.translatesAutoresizingMaskIntoConstraints = false
//         closeButton.setTitle("Close", for: [])
         closeButton.addTarget(self, action: #selector(closeTapped), for: .primaryActionTriggered)

        pageViewController.view.addSubview(closeButton)
     }
     
     private func layout() {
         // Close
         NSLayoutConstraint.activate([
             closeButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
             closeButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2)
         ])
     }
}

// MARK: - UIPageViewControllerDataSource
extension OnboardingContainerViewController: UIPageViewControllerDataSource {

    //this function define what to do when page is swiped back
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return getPreviousViewController(from: viewController)
    }
    
    //this function define what to do when page is swiped forward
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return getNextViewController(from: viewController)
    }

    //below two functions sets up the currentviewcontroller and also check for index errors
    private func getPreviousViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        currentVC = pages[index - 1]
        return pages[index - 1]
    }

    private func getNextViewController(from viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { return nil }
        currentVC = pages[index + 1]
        return pages[index + 1]
    }

    //this function return the number of page to display
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pages.count
    }
    
    //this function tells the index of page to load
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return pages.firstIndex(of: self.currentVC) ?? 0
    }
}


extension OnboardingContainerViewController{
    @objc func closeTapped( sender:UIButton){
        print("close button tapped")
        delegate?.didUserOnboarded()
    }
}

