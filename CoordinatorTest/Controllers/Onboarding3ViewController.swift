//
//  Onboarding3ViewController.swift
//  CoordinatorTest
//
//  Created by Богдан Семенюк on 21.01.2021.
//

import UIKit

protocol OnboardingFinishCoordinatorDelegate: class {
    func finishOnboarding(navigationController: UINavigationController?)
}

class Onboarding3ViewController: UIViewController {
    weak var coordinatorDelegate: OnboardingFinishCoordinatorDelegate?

    @IBAction func finishOnboardingAction(_ sender: UIButton) {
        coordinatorDelegate?.finishOnboarding(navigationController: navigationController)
    }
}
