//
//  ViewController2.swift
//  promoTest
//
//  Created by Дмитрий Деникаев on 20.09.17.
//  Copyright © 2017 Dmitriy Denikaev. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController2: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var photo: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photo.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell2
        
        cell.imageView.sd_setImage(with: URL(string: photo[indexPath.item]))
        
        return cell
    }
}

