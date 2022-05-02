//
//  RickMortyViewModel.swift
//  RickMortyApp
//
//  Created by Mine Rala on 30.04.2022.
//

import Foundation

protocol IRickMortyViewModel{
    func fetchItems()
    func changeLoading()
    
    var rickMortyCharacters: [Result] { get set }
    var rickMortyService: IRickMortyService { get }
    //RickMortyService propertisini kullanabilmek için get ile protocolün içine yazdım.
    
    var rickMortyOutput: RickMortyOutput? { get }
    func setDelegate(output: RickMortyOutput)
}

final class RickMortyViewModel: IRickMortyViewModel {
    func setDelegate(output: RickMortyOutput) {
        rickMortyOutput = output
        
    }
    
    var rickMortyOutput: RickMortyOutput?
    
    var rickMortyCharacters: [Result] = []
    private var isLoading: Bool = false
    let rickMortyService: IRickMortyService
   
    init() {
        rickMortyService = RickMortyService()
    }
    
    func fetchItems() {
        changeLoading()
        rickMortyService.fetchAllDatas { [weak self] (response) in
            self?.changeLoading()
            self?.rickMortyCharacters = response ?? []
            self?.rickMortyOutput?.saveDatas(values: self?.rickMortyCharacters ?? [])
        }
    }
    
    func changeLoading() {
        isLoading = !isLoading
        rickMortyOutput?.changeLoading(isLoading: isLoading)
    } 
}
