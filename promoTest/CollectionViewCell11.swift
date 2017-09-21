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

	// this is our "call-back" closure
	// it is set in cellForItemAt in the Collection View Controller
	// this allows us to "send back" data when a cell is selected
	var didSelectAction: ((IndexPath) -> ())?
	
	// an array of Hall objects, set in cellForItemAt in the Collection View Controller
	var theHalls: [Hall] = []
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return theHalls.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell12
		cell.imageView.sd_setImage(with: URL(string: theHalls[indexPath.item].qwertyURL))
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		// when a cell is tapped, we send *that cell's index* back to our View Controller
		
		didSelectAction?(indexPath)
	
	}

}

