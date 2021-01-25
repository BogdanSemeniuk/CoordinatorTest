//
//  AccountViewController.swift
//  CoordinatorTest
//
//  Created by Богдан Семенюк on 21.01.2021.
//

import UIKit

protocol AccountCoordinatorDelegate: class {
    func backToMovies()
}

class AccountViewController: UIViewController {
    
    weak var coordinatorDelegate: AccountCoordinatorDelegate?
    
    @IBAction func backAction(_ sender: UIButton) {
        coordinatorDelegate?.backToMovies()
    }
}
