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
        copyDatabase()
        self.filmsList = fRepo.filmsList
        filmsReload()
    }
    
    func filmsReload() {
        fRepo.filmsReload()
    }
    
    func copyDatabase() {
        let bundlePath = Bundle.main.path(forResource: "film", ofType: ".sqlite")
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let placeToCopy = URL(fileURLWithPath: targetPath).appendingPathComponent("film.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: placeToCopy.path) {
            print("It already have DataBase")
        } else {
            do {
                try fileManager.copyItem(atPath: bundlePath!, toPath: placeToCopy.path)
            } catch {}
        }
    }
}
