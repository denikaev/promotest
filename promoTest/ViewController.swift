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
	
	// array of Studio objects
    var theStudios: [Studio] = []
	
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ref = Database.database().reference(withPath: "Студии2")
        
        ref.observe(.value, with: { (snapshot) in
			
            for imageSnap in snapshot.children {
				
                let studioObj = Studio(snapshot: imageSnap as! DataSnapshot)

				self.theStudios.append(studioObj)
				
            }
			
            self.collectionView.reloadData()
			
		})
    }
	
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return theStudios.count
    }
	
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell11
		
		// give the cell an array of Hall objects for this Studio
		cell.theHalls = theStudios[indexPath.item].halls
		
		// assign the cell's "call back" closure
		
		cell.didSelectAction = {
			
			(innerPath) in
		
			// un-comment to see output the information to the debug console
			//print("\n\t--- \n\t--- \nCell number", innerPath.row, "on row", indexPath.row, "was tapped! \n\t--- \n\t---")
			
			// indexPath is which cell ("row") was selected in *our* collection view
			// innerPath is which cell was selected in *the cell's* collection view
			
			self.showDetailsView(indexPath, cellPath: innerPath)
			
		}
		
        return cell
    }
	
	func showDetailsView(_ rowPath: IndexPath, cellPath: IndexPath ) -> Void {

		if let vc2 = self.storyboard?.instantiateViewController(withIdentifier: "ViewController2") as? ViewController2 {

			// get the Studio object associated with the row that was selected
			let thisStudio = theStudios[rowPath.row]
			
			// get the Hall object associated with the cell that was selected
			let thisHall = thisStudio.halls[cellPath.row]
			
			// assign the Hall object to View Controller 2
			vc2.theHall = thisHall
			
			// clear the "Back" label from the back button
			let backItem = UIBarButtonItem()
			backItem.title = ""
			self.navigationItem.backBarButtonItem = backItem

			// push to the new VC
			self.navigationController?.pushViewController(vc2, animated: true)

		}
		
	}
	
}
