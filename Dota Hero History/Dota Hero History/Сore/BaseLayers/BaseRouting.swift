//
//  BaseRouting.swift
//  Dota Hero History
//
//  Created by Andrey on 30/01/2023.
//  Copyright © 2023 AndreyTeam. All rights reserved.
//

import UIKit.UIViewController

protocol BaseRouting: AnyObject {
    func dismiss()
    func popToRoot()
    func pop()
    func present(newVC: UIViewController, animated: Bool)
    func showErrorAlert(message: String)
    func showAlert(title: String?, message: String?, actions: [UIAlertAction]?)
}

extension BaseRouting where Self: BaseRouter {
    func dismiss() {
        if let nvc = viewController.navigationController {
            nvc.dismiss(animated: true)
        } else {
            viewController.dismiss(animated: true)
        }
    }
    
    func popToRoot() {
        if let nvc = viewController.navigationController {
            nvc.popToRootViewController(animated: true)
        }
    }

    func pop() {
        if let nvc = viewController.navigationController {
            nvc.popViewController(animated: true)
        }
    }
    
    func present(newVC: UIViewController, animated: Bool = true) {
        viewController.present(newVC, animated: animated, completion: nil)
    }
    
    func showErrorAlert(message: String) {
        let actions: [UIAlertAction] = [
            UIAlertAction(title: "", style: .cancel, handler: nil)
        ]
        showAlert(title: "", message: message, actions: actions)
    }
    
    func showAlert(title: String? = nil, message: String? = nil, actions: [UIAlertAction]? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        guard let actions = actions else {
            return present(newVC: alert)
        }
        actions.forEach({ alert.addAction($0) })
        present(newVC: alert)
    }
}
