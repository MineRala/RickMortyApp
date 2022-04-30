//
//  RickMortyModel.swift
//  RickMortyApp
//
//  Created by Mine Rala on 30.04.2022.
//

import Foundation

//MARK: - PostModel
struct PostModel {
    let info: Info?
    let results: [Result]?
}

//MARK: - Info
struct Info {
    let count: Int?
    let pages: Int?
    let next: String?
}

//MARK: - Result
struct Result {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin: Location?
    let location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}

//MARK: - Location
struct Location {
    let name: String?
    let url: String?
}
