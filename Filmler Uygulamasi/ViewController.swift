//
//  ViewController.swift
//  Filmler Uygulamasi
//
//  Created by Abdüssamed Söğüt on 26.02.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var kategoriTableView: UITableView!
    
    var kategoriListe = [Kategoriler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        veriTabaniKopyala()
        
        kategoriTableView.dataSource = self
        kategoriTableView.delegate = self
        
        kategoriListe = Kategorilerdao().tumKategorilerAl()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indeks = sender as? Int
        let gidilecekVC = segue.destination as! FilmViewController
        gidilecekVC.kategori = kategoriListe[indeks!]
        
    }
    
    

    func veriTabaniKopyala() {
        let bundleYolu = Bundle.main.path(forResource: "filmler", ofType: ".sqlite")
        
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        let fileManager = FileManager.default
        
        let kopyalanacakYer = URL(filePath: hedefYol).appending(component: "filmler.sqlite")
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("veritabanı zaten var. Kopyalamaya gerek yok ")
        } else {
            do {
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            } catch  {
                print(error)
            }
        }
    }
 
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kategoriListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                
        let cell = tableView.dequeueReusableCell(withIdentifier: "kategoriHucre", for: indexPath) as! KategoriHucreTableViewCell
        
        cell.labelKategoriAd.text = kategoriListe[indexPath.row].kategori_ad
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toFilm", sender: indexPath.row)
        
    }
    
}
