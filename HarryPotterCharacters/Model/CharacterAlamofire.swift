//
//  CharacterDataAlamofire.swift
//  HarryPotterCharacters
//
//  Created by Ionut Ciovica on 03/11/2021.
//

import Foundation

struct CharacterAlamofire: Codable, Comparable {

    let name: String
    let hogwartsStudent: Bool
    let hogwartsStaff: Bool
    let house: String
    
    static func < (lhs: CharacterAlamofire, rhs: CharacterAlamofire) -> Bool {
        return lhs.name < rhs.name
    }
}
