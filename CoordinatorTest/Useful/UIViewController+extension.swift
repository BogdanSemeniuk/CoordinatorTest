//
//  UIViewController+extension.swift
//  CoordinatorTest
//
//  Created by Богдан Семенюк on 21.01.2021.
//

import UIKit

extension UIViewController {
    static func make() -> Self {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: String(describing: Self.self)) as! Self
        return controller
    }
}
