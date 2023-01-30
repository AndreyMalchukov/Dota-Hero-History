//
//  BaseRouter.swift
//  Dota Hero History
//
//  Created by Andrey on 30/01/2023.
//  Copyright © 2023 AndreyTeam. All rights reserved.
//

import UIKit.UIViewController

class BaseRouter: BaseRouting {
    private(set) unowned var viewController: UIViewController

    init(_ viewController: UIViewController) {
        self.viewController = viewController
    }
}
