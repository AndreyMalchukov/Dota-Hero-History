//
//  ListOfHeroesListOfHeroesInteractor.swift
//  Dota Hero History
//
//  Created by Andrey on 30/01/2023.
//  Copyright © 2023 AndreyTeam. All rights reserved.
//

import Foundation
import UIKit

final class ListOfHeroesInteractor {
    
    // MARK: - Public properties
    
    var heroes = [HeroInfo]()
    
    // MARK: - Private properties
    
    private weak var output: ListOfHeroesInteractorOutput?
    
    // MARK: - Private methods
    
    private func downloadJSON() {
        guard let url = URL(string: "https://api.opendota.com/api/heroStats") else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error == nil {
                do {
                    self.heroes = try JSONDecoder().decode([HeroInfo].self, from: data!)
                    DispatchQueue.main.async {
                        self.output?.didReceiveList(result: self.heroes)
                    }
                }
                 catch let catchError {
                     self.output?.showAlert(error: catchError.localizedDescription)
                }
            } else {
                self.output?.showAlert(error: error?.localizedDescription ?? String())
            }
        }.resume()
    }
}

    // MARK: - ListOfHeroesInteractorInput

extension ListOfHeroesInteractor: ListOfHeroesInteractorInput {
    func attach(_ output: ListOfHeroesInteractorOutput) {
        self.output = output
        downloadJSON()
    }
}
