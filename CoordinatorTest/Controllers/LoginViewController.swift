//
//  LoginViewController.swift
//  CoordinatorTest
//
//  Created by Богдан Семенюк on 21.01.2021.
//

import UIKit

protocol LoginCoordinatorDelegate: class {
    func showOnboardingViewController(navigationController: UINavigationController?)
    func showCreateAccountViewController()
}

class LoginViewController: UIViewController {

    weak var coordinatorDelegate: LoginCoordinatorDelegate?
    
    @IBAction func signInAction(_ sender: UIButton) {
        guard UserDefaults.standard.string(forKey: UserDefaultsKey.tokenKey) != nil else { return }
        coordinatorDelegate?.showOnboardingViewController(navigationController: navigationController)
    }
    
    
    @IBAction func createAccountAction(_ sender: UIButton) {
        coordinatorDelegate?.showCreateAccountViewController()
    }
}

