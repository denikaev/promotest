//
//  ViewController.swift
//  promoTest
//
//  Created by Дмитрий Деникаев on 20.09.17.
//  Copyright © 2017 Dmitriy Denikaev. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var image: [Model] = []
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference(withPath: "Студии2")
        
        ref.observe(.value, with: { (snapshot) in
            var newImage: [Model] = []
            
            for imageSnap in snapshot.children {
                let imageObj = Model(snapshot: imageSnap as! DataSnapshot)
                newImage.append(imageObj)
            }
            self.image = newImage
            self.collectionView.reloadData()
        })
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell11
		
		cell.imageURLs = image[indexPath.item].images
		
		cell.didSelectAction = {
			
			(innerPath) in
			
			print("\n\t--- \n\t--- \nCell number", innerPath.row, "on row", indexPath.row, "was tapped! \n\t--- \n\t---")
//			print("Cell was tapped:", indexPath, " / ", innerPath)
			
			self.showDetailsView(indexPath, cellPath: innerPath)
			
		}
		
        return cell
    }
	
	func showDetailsView(_ rowPath: IndexPath, cellPath: IndexPath ) -> Void {

		let thisModel = image[rowPath.row]
		let imageURLs = thisModel.images
		
		if let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "ViewController2") as? ViewController2 {

			vc2.photo = imageURLs
			
			let backItem = UIBarButtonItem()
			backItem.title = ""
			self.navigationItem.backBarButtonItem = backItem
			self.navigationController?.pushViewController(vc2, animated: true)

		}
		
		//			let vc2 = vc1!.storyboard?.instantiateViewController(withIdentifier: "ViewController2") as! ViewController2
		//			let backItem = UIBarButtonItem()
		//			backItem.title = ""
		//			vc1!.navigationItem.backBarButtonItem = backItem
		//			vc1!.navigationController?.pushViewController(vc2, animated: true)

		
	}
	
}
