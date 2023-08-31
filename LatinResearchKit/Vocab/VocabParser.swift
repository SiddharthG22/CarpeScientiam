//
//  VocabParser.swift
//  LatinResearchKit
//
//  Created by Siddharth Ganapathy on 9/4/21.
//

import Foundation

struct People: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [Person]
}

// MARK: - Person
struct Person: Codable {
    let name, height, mass, hairColor: String
    let skinColor, eyeColor, birthYear: String
    let gender: String
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

//--------------------------------------------------------------------------------------

struct Word: Codable {
    let count: Int
    let next, previous: String
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let lemma: String
    let pos: Pos
    let morpho, uri, prosody: String
}

enum Pos: String, Codable {
    case a = "a"
    case n = "n"
    case r = "r"
    case v = "v"
}



// MARK: - Welcome
struct Welcome: Codable {
    let html: HTML
}

// MARK: - HTML
struct HTML: Codable {
    let body: [Body]
}

// MARK: - Body
struct Body: Codable {
    let bgcolor: String
    let h2: H2
    let pre: String

    enum CodingKeys: String, CodingKey {
        case bgcolor = "@bgcolor"
        case h2, pre
    }
}

// MARK: - H2
struct H2: Codable {
    let align: String
    let a: A

    enum CodingKeys: String, CodingKey {
        case align = "@align"
        case a
    }
}

// MARK: - A
struct A: Codable {
    let href, text: String

    enum CodingKeys: String, CodingKey {
        case href = "@href"
        case text = "#text"
    }
}
