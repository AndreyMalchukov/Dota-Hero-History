//
//  HeroTableCell.swift
//  Dota Hero History
//
//  Created by Andrey on 30/01/2023.
//  Copyright © 2023 AndreyTeam. All rights reserved.
//

import UIKit
import Kingfisher

final class HeroTableCell: UITableViewCell {
    
    // MARK: - Public properties
    
    var model: HeroInfo?
    var arrowTapped: ((HeroInfo) -> Void)?
    
    // MARK: - @IBOutlets
    
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var attackTypeLabel: UILabel!
    @IBOutlet var roleLabel: UILabel!
    
    // MARK: - @IBActions

    @IBAction func clickMoreTouchUpInside() {
        guard let model = model else { return }
        arrowTapped?(model)
    }
    
    // MARK: - Public methods
    
    func setupCell(model: HeroInfo) {
        self.model = model
        self.avatarImageView.kf.setImage(with: URL(string: ("https://api.opendota.com" + model.icon)))
        self.nameLabel.text = model.localizedName
        self.attackTypeLabel.text = model.attackType
        self.roleLabel.text = model.roles.joined(separator: ", ")
    }
}
