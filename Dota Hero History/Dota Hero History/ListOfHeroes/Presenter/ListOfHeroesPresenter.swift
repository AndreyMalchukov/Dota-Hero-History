//
//  ListOfHeroesListOfHeroesPresenter.swift
//  Dota Hero History
//
//  Created by Andrey on 30/01/2023.
//  Copyright © 2023 AndreyTeam. All rights reserved.
//

import Foundation

final class ListOfHeroesPresenter {
    
    // MARK: - Private properties

    private let router: ListOfHeroesRouting
    private let interactor: ListOfHeroesInteractorInput
    private unowned let view: ListOfHeroesPresenterOutput
    
    // MARK: - Lifecycle
    
    init(_ router: ListOfHeroesRouting, _ interactor: ListOfHeroesInteractorInput, _ view: ListOfHeroesPresenterOutput) {
        self.router = router
        self.interactor = interactor
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.attach(self)
    }
}

    // MARK: - ListOfHeroesPresenterInput

extension ListOfHeroesPresenter: ListOfHeroesPresenterInput {
    func arrowTapped(model: HeroInfo) {
        router.arrowTapped(model: model)
    }
}

    // MARK: - ListOfHeroesInteractorOutput

extension ListOfHeroesPresenter: ListOfHeroesInteractorOutput {
    func showAlert(error: String) {
        router.showErrorAlert(message: error)
    }
    
    func didReceiveList(result: [HeroInfo]) {
        view.getModel(model: result)
    }
}
