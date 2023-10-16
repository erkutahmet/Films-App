//
//  FilmCell.swift
//  Films App
//
//  Created by Ahmet Erkut on 16.10.2023.
//

import UIKit

protocol FilmCellProtocol {
    func addToBasketClicked(indexPath: IndexPath)
}

class FilmCell: UICollectionViewCell {
    
    @IBOutlet weak var imagePriceLabel: UILabel!
    @IBOutlet weak var filmImageView: UIImageView!
    
    var filmCellProtocol: FilmCellProtocol?
    var indexPath: IndexPath?
    
    @IBAction func addToBasketButton(_ sender: Any) {
        filmCellProtocol?.addToBasketClicked(indexPath: indexPath!)
    }
    
}
