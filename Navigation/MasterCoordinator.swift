//
//  MasterCoordinator.swift
//  Nexus
//
//  Created by Zacc Konfor on 5/4/26.
//

import UIKit

protocol Coordinator {
    
    var childCoordinators : [Coordinator] {get set}
    var navigationController: UINavigationController {get set}
    func start()
}

final class MasterCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    var window: UIWindow?
    
    init(scene: UIWindow, navigation: UINavigationController) {
        self.window = scene
        self.navigationController = navigation
        scene.configure(with: navigation)
        navigation.configuration()
        
    }
    
    convenience init() {
        self.init(scene: UIWindow(), navigation: UINavigationController())
    }
    
    func start() {
        let mainView = MainViewController()
        mainView.delegate = self
        navigationController.pushViewController(mainView, animated: true)
    }
    
}

extension MasterCoordinator: MainViewDelegate {
    func didTapLogin() {
        let login = LoginViewController()
        login.delegate = self
        navigationController.pushViewController(login, animated: true)
    }
    func didTapSignUp() {
        let signUp = SignUpViewController()
        signUp.delegate = self
        navigationController.pushViewController(signUp, animated: true)
    }
    func didTapEnterTheNexus() {
        let containerView = ContainerViewController()
        let login = LoginViewController()
        login.delegate = self
        containerView.modalPresentationStyle = .fullScreen
        navigationController.present(containerView, animated: true)
    }
}

extension MasterCoordinator: SignUpViewDelegate {
    func didTapDone() {
        let login = LoginViewController()
        login.delegate = self
        navigationController.pushViewController(login, animated: true)
    }
}
extension MasterCoordinator: LoginViewDelegate {
    func didTapSignIn() {
        let containerView = ContainerViewController()
        let login = LoginViewController()
        login.delegate = self
       containerView.modalPresentationStyle = .fullScreen
       navigationController.present(containerView, animated: true)
    }
}

private extension UIWindow {
    func configure(with navigation: UINavigationController) {
        makeKeyAndVisible()
        rootViewController = navigation
    }
}
private extension UINavigationController {
    func configuration() {
        navigationBar.isHidden = true
    }
}
