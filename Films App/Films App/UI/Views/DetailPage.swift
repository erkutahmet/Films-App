//
//  DetailPage.swift
//  Films App
//
//  Created by Ahmet Erkut on 16.10.2023.
//

import UIKit

class DetailPage: UIViewController {

    @IBOutlet weak var filmPriceLabel: UILabel!
    @IBOutlet weak var filmImageView: UIImageView!
    @IBOutlet weak var filmNameLabel: UILabel!
    
    var film: Films?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    private func setUpUI() {
        if let f = film {
            filmNameLabel.text = f.name
            filmImageView.image = UIImage(named: f.image!)
            filmPriceLabel.text = "\(f.price!) ₺"
        }
    }
}
