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
    
    let db: FMDatabase?
    init() {
        let targetPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let databaseURL = URL(fileURLWithPath: targetPath).appendingPathComponent("film.sqlite")
        
        db = FMDatabase.init(path: databaseURL.path())
    }
    
    func filmsReload() {
        db?.open()
        var list = [Films]()
        
        do {
            let rs = try db!.executeQuery("SELECT * FROM films", values: nil)
            
            while rs.next() {
                let film = Films(id: Int(rs.string(forColumn: "id"))!,
                                 name: rs.string(forColumn: "name")!,
                                 image: rs.string(forColumn: "image")!,
                                 price: Int(rs.string(forColumn: "price"))!)
                
                list.append(film)
            }
            
            filmsList.onNext(list)
        } catch {
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
