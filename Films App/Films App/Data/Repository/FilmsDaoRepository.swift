//
//  FilmsDaoRepository.swift
//  Films App
//
//  Created by Ahmet Erkut on 17.10.2023.
//

import Foundation
import RxSwift

class FilmsDaoRepository {
    
    var filmsList = BehaviorSubject<[Films]>(value: [Films]())
    
    func filmsReload() {
        var list = [Films]()
        let f1 = Films(id: 1, name: "Django", image: "django", price: 24)
        let f2 = Films(id: 2, name: "Interstellar", image: "interstellar", price: 32)
        let f3 = Films(id: 3, name: "Inception", image: "inception", price: 16)
        let f4 = Films(id: 4, name: "The Hateful Eight", image: "thehatefuleight", price: 28)
        let f5 = Films(id: 5, name: "The Pianist", image: "thepianist", price: 18)
        let f6 = Films(id: 6, name: "Anadoluda", image: "anadoluda", price: 10)
        list.append(f1)
        list.append(f2)
        list.append(f3)
        list.append(f4)
        list.append(f5)
        list.append(f6)
        filmsList.onNext(list)
    }
}
