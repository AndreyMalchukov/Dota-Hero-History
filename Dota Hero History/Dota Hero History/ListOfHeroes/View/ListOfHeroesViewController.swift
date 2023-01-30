//
//  ListOfHeroesListOfHeroesViewController.swift
//  Dota Hero History
//
//  Created by Andrey on 30/01/2023.
//  Copyright © 2023 AndreyTeam. All rights reserved.
//

import UIKit

final class ListOfHeroesViewController: UIViewController {
    
    // MARK: - Public properties
    
    var presenter: ListOfHeroesPresenterInput!
    
    // MARK: - Private properties
    
    private var model: [HeroInfo] = []
    
    // MARK: - @IBOutlets
    
    @IBOutlet var tableView: UITableView!
    
    // MARK: - Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    // MARK: - Private methods
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.allowsMultipleSelection = false
        tableView.separatorStyle = .none
        let cellNib = UINib.init(nibName: String(describing: HeroTableCell.self), bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: String(describing: HeroTableCell.self))
    }
}

    // MARK: - ListOfHeroesPresenterOutput

extension ListOfHeroesViewController: ListOfHeroesPresenterOutput {
    func getModel(model: [HeroInfo]) {
        self.model = model.sorted { $0.localizedName < $1.localizedName}
        setupTableView()
    }
}

    // MARK: - UITableViewDataSource, UITableViewDelegate

extension ListOfHeroesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: HeroTableCell.self), for: indexPath) as? HeroTableCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.arrowTapped = { [weak self] model in
            self?.presenter.arrowTapped(model: model)
        }
        cell.setupCell(model: model[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
