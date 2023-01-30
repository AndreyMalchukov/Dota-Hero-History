//
//  HeroInformationHeroInformationInteractor.swift
//  Dota Hero History
//
//  Created by Andrey on 30/01/2023.
//  Copyright © 2023 AndreyTeam. All rights reserved.
//

import Foundation

final class HeroInformationInteractor {
    private weak var output: HeroInformationInteractorOutput?
}

// MARK: - HeroInformationInteractorInput

extension HeroInformationInteractor: HeroInformationInteractorInput {
    func attach(_ output: HeroInformationInteractorOutput) {
        self.output = output
    }
}
