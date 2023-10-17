//
//  ViewController.swift
//  Films App
//
//  Created by Ahmet Erkut on 16.10.2023.
//

import UIKit

class HomePage: UIViewController {

    @IBOutlet private weak var filmsCollectionView: UICollectionView!
    
    var filmsList = [Films]()
    
    var homePageVM = HomePageViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setCollectionUI()
        
        _ = homePageVM.filmsList.subscribe(onNext: { list in
            self.filmsList = list
            self.filmsCollectionView.reloadData()
        })
    }
    
    private func setUI() {
        filmsCollectionView.dataSource = self
        filmsCollectionView.delegate = self
    }
    
    private func setCollectionUI() {
        let design = UICollectionViewFlowLayout()
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        design.minimumLineSpacing = 10
        design.minimumInteritemSpacing = 10
        
        let screenWidth = UIScreen.main.bounds.width
        let itemWidth = (screenWidth - 30) / 2
        
        design.itemSize = CGSize(width: itemWidth, height: itemWidth * 1.7)
        filmsCollectionView.collectionViewLayout = design
    }
    
}

extension HomePage: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filmsList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let film = filmsList[indexPath.row]
        
        let cell = filmsCollectionView.dequeueReusableCell(withReuseIdentifier: "filmCell", for: indexPath) as! FilmCell
        
        cell.filmImageView.image = UIImage(named: film.image!)
        cell.imagePriceLabel.text = "\(film.price!) ₺"
        
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.borderWidth = 0.3
        cell.layer.cornerRadius = 10.0
        
        cell.filmCellProtocol = self
        cell.indexPath = indexPath
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let film = filmsList[indexPath.row]
        performSegue(withIdentifier: "toDetail", sender: film)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            if let data = sender as? Films {
                let toVC = segue.destination as! DetailPage
                toVC.film = data
            }
        }
    }
}

extension HomePage: FilmCellProtocol {
    func addToBasketClicked(indexPath: IndexPath) {
        let film = filmsList[indexPath.row]
        print("\(film.name!) added to basket.")
    }
}

