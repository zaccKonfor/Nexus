//
//  MainViewController.swift
//  Nexus
//
//  Created by Zacc Konfor on 5/4/26.
//

import UIKit

class MainViewController: UIViewController {

    weak var delegate: MainViewDelegate?
    var theSignUpButton = CustomButton()
    var theLoginButton = CustomButton()
    var theNexusButton = CustomButton()
    var theLabel = CustomLabel()
    var theWelcomeLabel = CustomLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showBackgroundImage()
        showLabel()
        showAppLogo()
        enterTheNexus()
    }
    
    //Mark: - selectors
    
    @objc func tapLoginButton() {
        theLoginButton.shake()
        delegate?.didTapLogin()
        
       }
       
    @objc func tapSignUpButton() {
        theSignUpButton.shake()
        delegate?.didTapSignUp()
           
       }
    
    @objc func tapTakeMeToChat() {
        let nexus = NexusViewController()
        theNexusButton.shake()
        if LoginViewController.userIsLoggedIn == false {
           delegate?.didTapEnterTheNexus()
           LoginViewController.userIsLoggedIn = true
            
        }
    }
}

//setup sign up button
extension MainViewController {
    
   private func showSignUp() {
       
                 theSignUpButton.setTitle("SIGN UP", for: .normal)
                 theSignUpButton.addTarget(self, action: #selector(tapSignUpButton), for: .touchUpInside)
                 theSignUpButton.layer.borderColor = UIColor.black.cgColor
                 theSignUpButton.layer.shadowColor = UIColor.black.cgColor
       theSignUpButton.backgroundColor = Components.standardGold
                 theSignUpButton.setTitleColor(.black, for: .normal)
          let margins = self.view.layoutMarginsGuide
           view.addSubview(theSignUpButton)

      NSLayoutConstraint.activate([
                     theSignUpButton.heightAnchor.constraint(equalToConstant: 70),
                     theSignUpButton.widthAnchor.constraint(equalToConstant: 300),
                     theSignUpButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -90),
                     theSignUpButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor)
                ])
      }
}

// setup login Button
extension MainViewController {
   private func showLogin() {

           theLoginButton.setTitle("LOGIN", for: .normal)
           theLoginButton.addTarget(self, action: #selector(tapLoginButton), for: .touchUpInside)
           theLoginButton.setTitleColor(.yellow, for: .normal)
           theLoginButton.backgroundColor = .black
       theLoginButton.layer.borderColor = Components.standardGold.cgColor
       theLoginButton.layer.shadowColor = Components.standardGold.cgColor
    
    let margins = self.view.layoutMarginsGuide
       
    view.addSubview(theLoginButton)
    
    NSLayoutConstraint.activate([
               theLoginButton.heightAnchor.constraint(equalToConstant: 70),
               theLoginButton.widthAnchor.constraint(equalToConstant: 300),
               theLoginButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
               theLoginButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -10)
    ])
        }
}

// Set App Message
extension MainViewController {
    
   private func showLabel() {
       
        let margins = self.view.layoutMarginsGuide
              theLabel.text = ""
              theLabel.font = UIFont.init(name: "AvenirNext-DemiBold", size: 20)
       theLabel.textColor = Components.standardGold
              theLabel.layer.borderWidth = 3
              theLabel.layer.borderColor = Components.standardGold.cgColor
              theLabel.layer.shadowColor = Components.standardGold.cgColor
              theLabel.layer.cornerRadius = 7
        
        view.addSubview(theLabel)
        NSLayoutConstraint.activate([       theLabel.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
                   theLabel.centerYAnchor.constraint(equalTo: margins.centerYAnchor, constant: -160)])
    }
}


//set App Logo
extension MainViewController {
    private func showAppLogo() {
        guard let logoImage = UIImage(named: "google") else {
                    print("Error: Background image not found.")
                    return
                }
        let logoImageView = CustomImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        logoImageView.image = logoImage
        logoImageView.contentMode = .scaleAspectFill
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
                ])
    }
}

//Enter The Nexus Button
extension MainViewController {
   private func enterTheNexus() {

    let chatButton = theNexusButton
    chatButton.setTitle("ENTER THE NEXUS", for: .normal)
    chatButton.addTarget(self, action: #selector(tapTakeMeToChat), for: .touchUpInside)
    chatButton.setTitleColor(Components.standardGold, for: .normal)
    chatButton.backgroundColor = .darkGray
    chatButton.layer.borderColor = Components.standardGold.cgColor
    chatButton.layer.shadowColor = Components.standardGold.cgColor
    
    let margins = self.view.layoutMarginsGuide
    view.addSubview(chatButton)
    
    NSLayoutConstraint.activate([
        chatButton.heightAnchor.constraint(equalToConstant: 70),
        chatButton.widthAnchor.constraint(equalToConstant: 300),
        chatButton.centerXAnchor.constraint(equalTo: margins.centerXAnchor),
        chatButton.bottomAnchor.constraint(equalTo: margins.bottomAnchor, constant: -170)
    ])
        }
}

//setup background image
extension MainViewController {
    
    private func showBackgroundImage() {
        guard let backgroundImage = UIImage(named: "default_background") else {
                    print("Error: Background image not found.")
                    return
                }
        let backgroundImageView = UIImageView(image: backgroundImage)
            backgroundImageView.contentMode = .scaleAspectFill
            backgroundImageView.clipsToBounds = true
            backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(backgroundImageView)
            view.sendSubviewToBack(backgroundImageView)
        
        NSLayoutConstraint.activate([
                    backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
                    backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
                ])
    }
}


