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
    
    static func characterPath() -> String {
        return "\(BASE_URL.rawValue)\(PATH.rawValue)"
    }
}

protocol IRickMortyService {
    func fetchAllDatas(response: @escaping ([Result]?) -> Void)
}

// Datayı geri verebilmek için callback function olarak geri verebilmek için @escaping ekliyorum.
struct RickMortyService: IRickMortyService {
    func fetchAllDatas(response: @escaping ([Result]?) -> Void) {
        // responseDecodable yerine responseJSON kullanırsam hem error'ü de handle edebilirim.
        AF.request(RickMortyServiceEndPoint.characterPath()).responseDecodable(of: PostModel.self) { (model) in
            guard let data = model.value else {
                response(nil)
                return
            }
            // PostModel olarak gelecek kullanıcıya Result'ı göstericem.
            response(data.results)
            
        }
    }
}
