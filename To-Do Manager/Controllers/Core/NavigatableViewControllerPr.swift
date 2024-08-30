//
//  NavigatableViewControllerPr.swift
//  To-Do Manager
//
//  Created by Arman  Urstem on 29.08.2024.
//

import UIKit

protocol NavigatableViewControllerPr {}

extension NavigatableViewControllerPr {
    var uiViewController: UIViewController? {
        self as? UIViewController
    }
    
    func push(toNavigationController navigationController: UINavigationController?) {
        if let viewController = self as? UIViewController {
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
    
    func popFromNavigationController() {
        if let viewController = self as? UIViewController {
            viewController.navigationController?.popViewController(animated: true)
        }
    }
}
