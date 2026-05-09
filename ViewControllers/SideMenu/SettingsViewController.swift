//
//  SettingsViewController.swift
//  Nexus
//
//  Created by Zacc Konfor on 5/4/26.
//

import UIKit

class SettingsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white    }
    
    override func viewDidAppear(_ animated: Bool) {
        showNavBar()
    }
    
    //Mark: selectors
    
    @objc func handleDismiss() {
        dismiss(animated: true)
    }
    
    //Mark: Helper functions
    
    func showNavBar() {
        let nav = navigationController?.navigationBar
        let navItem = navigationItem
            navItem.title = "SETTINGS"
        nav?.backgroundColor = .darkGray
            nav?.tintColor = Components.standardGold
            nav?.titleTextAttributes = [NSAttributedString.Key.foregroundColor:Components.standardGold]
            nav?.barStyle = .default
        
        let xmark = UIImage(systemName: "xmark")
        navItem.leftBarButtonItem = UIBarButtonItem(image: xmark, style: .plain, target: self, action: #selector(handleDismiss))
    }

}
