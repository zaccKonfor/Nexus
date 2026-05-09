//
//  ContainerViewController.swift
//  Nexus
//
//  Created by Zacc Konfor on 5/4/26.
//

import UIKit

class ContainerViewController: UIViewController {

    var menuControl: MenuViewController!
    var centerController: UIViewController!
    var isExpanded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNexusController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }
    
//Mark:- Helper functions
    private func configureNexusController() {
        let home = NexusViewController()
        home.delegate = self
        centerController = UINavigationController(rootViewController: home)
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuController() {
     if menuControl == nil {
        menuControl = MenuViewController()
        menuControl.delegate = self
        view.insertSubview(menuControl.view, at: 0)
        addChild(menuControl)
        menuControl.didMove(toParent: self)
        print("Did Add Menu Controller")
       }
    }
    
    //Side Menu Animation
    func animatePanel(Expanded: Bool, menuOption: Menu?) {
        if Expanded {
            //show menu
            UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
                
            self.centerController!.view.frame.origin.x = self.centerController!.view.frame.width - 200
            }, completion: nil)
            
        } else {
            //hide menu
            UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.8,
                           initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController!.view.frame.origin.x = 0
            }) {(_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            }
        }
        animateStatusBar()
    }
    
    //Select menu option
    func didSelectMenuOption(menuOption: Menu) {
    
        let settings = SettingsViewController()
        
        switch menuOption {
        case .Settings:
            present(UINavigationController(rootViewController: settings), animated: true)
        case .LogOut:
            if LoginViewController.userIsLoggedIn == true {
                dismiss(animated: true)
                LoginViewController.userIsLoggedIn = false
            }
            print("logged out")
        }
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.9, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: {
            self.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
}

extension ContainerViewController: NexusViewDelegate {
    func handleMenuToggle(forMenuOption menuOption: Menu?) {
        isExpanded = !isExpanded
        if isExpanded {
            configureMenuController()
        }
        animatePanel(Expanded: isExpanded, menuOption: menuOption)
    }
}
