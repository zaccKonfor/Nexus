//
//  NavDelegate.swift
//  Nexus
//
//  Created by Zacc Konfor on 5/4/26.
//

import UIKit


protocol MainViewDelegate: AnyObject {
    func didTapLogin()
    func didTapSignUp()
    func didTapEnterTheNexus()
}

protocol LoginViewDelegate: AnyObject {
    func didTapSignIn()
}

protocol SignUpViewDelegate: AnyObject {
    func didTapDone()
}

protocol NexusViewDelegate: AnyObject {
    func handleMenuToggle(forMenuOption menuOption: Menu?)
}

protocol PopUpDelegate {
    func handleDismiss()
}
