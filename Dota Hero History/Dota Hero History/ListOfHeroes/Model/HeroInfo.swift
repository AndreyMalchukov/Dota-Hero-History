//
//  HeroInfo.swift
//  Dota Hero History
//
//  Created by Andrey on 30/01/2023.
//  Copyright © 2023 AndreyTeam. All rights reserved.
//

import Foundation

struct HeroInfo: Codable {
    let id: Int
    let name: String
    let localizedName: String
    let attackType: String
    let roles: [String]
    let img: String
    let icon: String
    let baseHealth: Int
    let baseHealthRegen: Double
    let baseMana: Int
    let baseManaRegen: Double
    let baseArmor: Double
    let moveSpeed: Int

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case localizedName = "localized_name"
        case attackType = "attack_type"
        case roles
        case img
        case icon
        case baseHealth = "base_health"
        case baseHealthRegen = "base_health_regen"
        case baseMana = "base_mana"
        case baseManaRegen = "base_mana_regen"
        case baseArmor = "base_armor"
        case moveSpeed = "move_speed"
    }
}
