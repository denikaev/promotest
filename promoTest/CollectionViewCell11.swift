//
//  CollectionViewCell11.swift
//  promoTest
//
//  Created by Дмитрий Деникаев on 20.09.17.
//  Copyright © 2017 Dmitriy Denikaev. All rights reserved.
//

import UIKit
import SDWebImage

class CollectionViewCell11: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var imagess: [Model] = []
    
    var vc1: ViewController?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagess.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell12
        cell.imageView.sd_setImage(with: URL(string: imagess[indexPath.item].image))
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if vc1 != nil {
            let vc2 = vc1!.storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
            vc2.photo = imagess[indexPath.item].images
            let backItem = UIBarButtonItem()
            backItem.title = ""
            vc1!.navigationItem.backBarButtonItem = backItem
            vc1!.navigationController?.pushViewController(vc2, animated: true)
        }
    }
}
