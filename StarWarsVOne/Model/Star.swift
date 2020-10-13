//
//  Star.swift
//  StarWarsVOne
//
//  Created by Ghassan  albakuaa  on 10/12/20.
//

import Foundation
// MARK: - Welcome
struct Welcome: Codable {
    let count: Int
    let next: String
    let results: [Result2]
}

// MARK: - Result
struct Result2: Codable {
    let name, height, mass, hairColor: String
    let skinColor, eyeColor, birthYear: String
    let gender: Gender
    let homeworld: String
    let films, species, vehicles, starships: [String]
    let created, edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name, height, mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender, homeworld, films, species, vehicles, starships, created, edited, url
    }
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
    case nA = "n/a"
}

