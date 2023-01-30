//
//  HeroInformationHeroInformationPresenter.swift
//  Dota Hero History
//
//  Created by Andrey on 30/01/2023.
//  Copyright © 2023 AndreyTeam. All rights reserved.
//

import Foundation

final class HeroInformationPresenter {
    
    // MARK: - Public properties
    
    var heroInformation: HeroInfo

    // MARK: - Private methods

    private let router: HeroInformationRouting
    private let interactor: HeroInformationInteractorInput
    private unowned let view: HeroInformationPresenterOutput
    
    // MARK: - Lifecycle
    
    init(_ router: HeroInformationRouting, _ interactor: HeroInformationInteractorInput, heroInformation: HeroInfo, _ view: HeroInformationPresenterOutput) {
        self.router = router
        self.interactor = interactor
        self.heroInformation = heroInformation
        self.view = view
    }

    func viewDidLoad() {
        interactor.attach(self)
        didReceiveList()
    }
}

    // MARK: - HeroInformationPresenterInput

extension HeroInformationPresenter: HeroInformationPresenterInput {
    func tapBackButton() {
        router.dismiss()
    }
}

    // MARK: - HeroInformationInteractorOutput

extension HeroInformationPresenter: HeroInformationInteractorOutput {
    func didReceiveList() {
        view.getModel(model: heroInformation)
    }
}
