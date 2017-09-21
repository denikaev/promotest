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
	
	// this is set by the "calling" view controller
	var theHall: Hall?
	
    override func viewDidLoad() {
        super.viewDidLoad()
    }
	
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		// make sure theHall is valid and has image URLs
		guard let n = theHall?.imageURLs.count else {
			return 0
		}
        return n
    }
	
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell2
		
		if let imgURL = theHall?.imageURLs[indexPath.item] {
		
			cell.imageView.sd_setImage(with: URL(string: imgURL))
			
		}
		
        return cell
    }
}

