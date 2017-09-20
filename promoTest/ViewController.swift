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
        cell.vc1 = self
        cell.imagess = [image[indexPath.item]]
        return cell
    }
}
