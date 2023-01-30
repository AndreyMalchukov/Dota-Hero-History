//
//  HeroInformationHeroInformationViewController.swift
//  Dota Hero History
//
//  Created by Andrey on 30/01/2023.
//  Copyright © 2023 AndreyTeam. All rights reserved.
//

import UIKit

final class HeroInformationViewController: UIViewController {
    
    // MARK: - Public properties
    
    var presenter: HeroInformationPresenterInput!
    
    // MARK: - @IBOutlets
    
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var nameHeroLabel: UILabel!
    @IBOutlet var healthLabel: UILabel!
    @IBOutlet var manaLabel: UILabel!
    @IBOutlet var attackTypeLabel: UILabel!
    @IBOutlet var armorLabel: UILabel!
    @IBOutlet var moveSpeedLabel: UILabel!
    @IBOutlet var healthRegenLabel: UILabel!
    @IBOutlet var manaRegenLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }
    
    // MARK: - @IBActions
    
    @IBAction func backButtonTouchUpInside() {
        presenter.tapBackButton()
    }
}

    // MARK: - HeroInformationPresenterOutput

extension HeroInformationViewController: HeroInformationPresenterOutput {
    func getModel(model: HeroInfo) {
        setupPage(model: model)
    }
    
    func setupPage(model: HeroInfo) {
        avatarImageView.kf.setImage(with: URL(string: ("https://api.opendota.com" + model.img)))
        avatarImageView.layer.cornerRadius = 12
        nameHeroLabel.text = model.localizedName
        healthLabel.text = model.baseHealth.description
        manaLabel.text = model.baseMana.description
        attackTypeLabel.text = model.attackType
        moveSpeedLabel.text = model.moveSpeed.description
        armorLabel.text = model.baseArmor.description
        healthRegenLabel.text = model.baseHealthRegen.description
        manaRegenLabel.text = model.baseManaRegen.description
    }
}
