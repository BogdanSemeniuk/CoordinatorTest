//
//  FlowManager.swift
//  CoordinatorTest
//
//  Created by Богдан Семенюк on 22.01.2021.
//

import UIKit

final class FlowManager {
    private var mainCoordinator: Coordinator!
    private var storage: UserDefaults
    private var window: UIWindow
    
    init(window: UIWindow, storage: UserDefaults) {
        self.storage = storage
        self.window = window
    }
    
    func start() {
        mainCoordinator = storage.string(forKey: UserDefaultsKey.tokenKey) == nil ?
            AuthenticationCoordinator(router: AuthenticationRouter(window: window)) :
            MoviesCoordinator(router: MoviesRouter(navigationController: UINavigationController(), window: window))
        mainCoordinator.show(animated: true, onDismissed: nil)
    }
}
