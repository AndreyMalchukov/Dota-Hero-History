//
//  ListOfHeroesListOfHeroesAssembler.swift
//  Dota Hero History
//
//  Created by Andrey on 30/01/2023.
//  Copyright © 2023 AndreyTeam. All rights reserved.
//

import Foundation
import UIKit

final class ListOfHeroesAssembler {
    static func createModule() -> ListOfHeroesViewController {
        let viewController = ListOfHeroesViewController()
        let router = ListOfHeroesRouter(viewController)
        let interactor = ListOfHeroesInteractor()
        let presenter = ListOfHeroesPresenter(router, interactor, viewController)
        viewController.presenter = presenter
        return viewController
    }
}
