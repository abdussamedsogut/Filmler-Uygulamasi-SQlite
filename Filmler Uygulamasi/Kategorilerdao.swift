//
//  Kategorilerdao.swift
//  Filmler Uygulamasi
//
//  Created by Abdüssamed Söğüt on 27.02.2023.
//

import Foundation

class Kategorilerdao {
    
    let db:FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(filePath: hedefYol).appending(path: "filmler.sqlite")
        
        db = FMDatabase(path: veritabaniURL.path)
            
    }
    
    func tumKategorilerAl() -> [Kategoriler] {
        var liste = [Kategoriler]()
        
        db?.open()
        
        
        do {
          let rs = try db!.executeQuery("SELECT * FROM kategoriler ", values: nil)
            
            while rs.next() {
                let kategori = Kategoriler(kategori_id: Int(rs.string(forColumn: "kategori_id"))!, kategori_ad: rs.string(forColumn: "kategori_ad")!)
                
                liste.append(kategori)
            
            }
            
        } catch  {
            print(error.localizedDescription)
        }
        
        
        db?.close()
        
        return liste
    }
    
    
}
