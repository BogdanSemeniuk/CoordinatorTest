//
//  CreateAccountViewController.swift
//  CoordinatorTest
//
//  Created by Богдан Семенюк on 21.01.2021.
//

import UIKit

protocol CreateAccountCoordinatorDelegate: class {
    func backToLoginViewController()
}

class CreateAccountViewController: UIViewController {
    
    weak var coordinatorDelegate: CreateAccountCoordinatorDelegate?
    
    @IBAction func createAccountAction(_ sender: UIButton) {
        UserDefaults.standard.setValue(UUID().uuidString, forKey: UserDefaultsKey.tokenKey)
        coordinatorDelegate?.backToLoginViewController()
    }
    
}
