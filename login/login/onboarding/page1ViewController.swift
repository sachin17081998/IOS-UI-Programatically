//
//  page1ViewController.swift
//  login
//
//  Created by Sachin kumar Singh on 01/03/22.
//


import Foundation
import UIKit

class page1ViewController: UIViewController {

    let stackView = UIStackView()
    let titleLabel = UILabel()
    
    let imagename:String
    let labeltext:String
    
    let image=UIImageView()

   
    init(img:String,text:String) {
        imagename=img
        labeltext=text

        super.init(nibName: nil, bundle: nil)
     
    }
//
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented - not using storyboards")
    }
//
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}

extension page1ViewController {
    func style() {
        view.backgroundColor = .white

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 20

        //image
        image.translatesAutoresizingMaskIntoConstraints=false
        image.image=UIImage(named: imagename)
        image.contentMode = .scaleAspectFit
        
        
        // Label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.text=labeltext
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        titleLabel.numberOfLines=0
        titleLabel.adjustsFontForContentSizeCategory=true

    }

    func layout() {
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(titleLabel)

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
    }
}

