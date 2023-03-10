//
//  FilmDetayViewController.swift
//  Filmler Uygulamasi
//
//  Created by Abdüssamed Söğüt on 26.02.2023.
//

import UIKit

class FilmDetayViewController: UIViewController {

    var film:Filmler?
    
    @IBOutlet weak var imageViewFilmResim: UIImageView!
    @IBOutlet weak var labelFilmAd: UILabel!
    @IBOutlet weak var labelFilmYil: UILabel!
    @IBOutlet weak var labelFilmKategori: UILabel!
    @IBOutlet weak var labelFilmYonetmen: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        if let k = film {
            imageViewFilmResim.image = UIImage(named: k.film_resim!)
            labelFilmAd.text = k.film_ad
            labelFilmYil.text = String(k.film_yil!)
            labelFilmKategori.text = k.kategori?.kategori_ad
            labelFilmYonetmen.text = k.yonetmen?.yonetmen_ad
            
            
        }
        
        
        
        
        
        
        
        
        
    }
    

    

}
