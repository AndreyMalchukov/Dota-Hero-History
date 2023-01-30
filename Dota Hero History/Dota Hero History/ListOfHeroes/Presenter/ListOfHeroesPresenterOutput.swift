//
//  ListOfHeroesListOfHeroesPresenterOutput.swift
//  Dota Hero History
//
//  Created by Andrey on 30/01/2023.
//  Copyright © 2023 AndreyTeam. All rights reserved.
//

import Foundation

protocol ListOfHeroesPresenterOutput: AnyObject {
    func getModel(model: [HeroInfo])
}
