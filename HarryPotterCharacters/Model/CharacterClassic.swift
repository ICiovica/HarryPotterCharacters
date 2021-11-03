//
//  CharacterClassic.swift
//  HarryPotterCharacters
//
//  Created by Ionut Ciovica on 02/11/2021.
//

import Foundation

struct CharacterClassic: Codable, Comparable {

    let name: String
    let hogwartsStudent: Bool
    let hogwartsStaff: Bool
    let house: String
    
    static func < (lhs: CharacterClassic, rhs: CharacterClassic) -> Bool {
        return lhs.name < rhs.name
    }
}
