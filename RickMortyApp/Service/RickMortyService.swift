//
//  RickMortyService.swift
//  RickMortyApp
//
//  Created by Mine Rala on 30.04.2022.
//

import Foundation
import Alamofire

enum RickMortyServiceEndPoint: String {
    case BASE_URL = "https://rickandmortyapi.com/api"
    case PATH = "/character"
}

protocol IRickMortyService {
    func fetchAllDatas()
}

struct RickMortyService: IRickMortyService {
    func fetchAllDatas() {
        
    }
    
    
    
}
