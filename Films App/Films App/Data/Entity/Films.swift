//
//  Films.swift
//  Films App
//
//  Created by Ahmet Erkut on 16.10.2023.
//

import Foundation

class Films {
    var id: Int?
    var name: String?
    var image: String?
    var price: Int?
    
    init() {
        
    }
    
    init(id: Int, name: String, image: String, price: Int) {
        self.id = id
        self.name = name
        self.image = image
        self.price = price
    }
}
