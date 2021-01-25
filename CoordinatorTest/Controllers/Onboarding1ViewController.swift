//
//  Onboarding1ViewController.swift
//  CoordinatorTest
//
//  Created by Богдан Семенюк on 21.01.2021.
//

import UIKit

protocol OnboardingCoordinatorDelegate: OnboardingFinishCoordinatorDelegate {
    func goToNexOnboardingViewController(after viewController: UIViewController)
}

class Onboarding1ViewController: UIViewController {
    
    weak var coordinatorDelegate: OnboardingCoordinatorDelegate?

    @IBAction func forwardAction(_ sender: UIButton) {
        coordinatorDelegate?.goToNexOnboardingViewController(after: self)
    }
    
    
    @IBAction func skipAction(_ sender: UIButton) {
        coordinatorDelegate?.finishOnboarding(navigationController: navigationController)
    }
}
