//
//  HomePageViewModel.swift
//  Films App
//
//  Created by Ahmet Erkut on 17.10.2023.
//

import Foundation
import RxSwift

class HomePageViewModel {
    
    var filmsList = BehaviorSubject<[Films]>(value: [Films]())
    var fRepo = FilmsDaoRepository()
    
    init() {
        self.filmsList = fRepo.filmsList
        filmsReload()
    }
    
    func filmsReload() {
        fRepo.filmsReload()
    }
    
}
