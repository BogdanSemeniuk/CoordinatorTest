//
//  Onboarding2ViewController.swift
//  CoordinatorTest
//
//  Created by Богдан Семенюк on 21.01.2021.
//

import UIKit

class Onboarding2ViewController: UIViewController {

    weak var coordinatorDelegate: OnboardingCoordinatorDelegate?
    
    @IBAction func forwardAction(_ sender: UIButton) {
        coordinatorDelegate?.goToNexOnboardingViewController(after: self)
    }
    
    
    @IBAction func skipAction(_ sender: UIButton) {
        coordinatorDelegate?.finishOnboarding(navigationController: navigationController)
    }
    
}
