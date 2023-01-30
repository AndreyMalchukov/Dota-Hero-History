//
//  HeroInformationHeroInformationAssembler.swift
//  Dota Hero History
//
//  Created by Andrey on 30/01/2023.
//  Copyright © 2023 AndreyTeam. All rights reserved.
//

import Foundation

final class HeroInformationAssembler {
    static func createModule(heroInformation: HeroInfo) -> HeroInformationViewController {
        let viewController = HeroInformationViewController()
        let router = HeroInformationRouter(viewController)
        let interactor = HeroInformationInteractor()
        let presenter = HeroInformationPresenter(router, interactor, heroInformation: heroInformation, viewController)
        viewController.presenter = presenter
        return viewController
    }
}
