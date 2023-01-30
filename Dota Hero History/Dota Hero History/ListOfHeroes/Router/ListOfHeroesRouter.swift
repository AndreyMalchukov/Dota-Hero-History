//
//  ListOfHeroesListOfHeroesRouter.swift
//  Dota Hero History
//
//  Created by Andrey on 30/01/2023.
//  Copyright © 2023 AndreyTeam. All rights reserved.
//

import UIKit.UIViewController

final class ListOfHeroesRouter: BaseRouter {}

// MARK: - ListOfHeroesRouting

extension ListOfHeroesRouter: ListOfHeroesRouting {
    func arrowTapped(model: HeroInfo) {
        let newVC = HeroInformationAssembler.createModule(heroInformation: model)
        viewController.present(newVC, animated: true)
    }
}
