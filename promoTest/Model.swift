//
//  Model.swift
//  promoTest
//
//  Created by Дмитрий Деникаев on 20.09.17.
//  Copyright © 2017 Dmitriy Denikaev. All rights reserved.
//

import Foundation
import Firebase

// a "Hall" has 
//	a hallName
//	a "qwerty" image URL (the main image for the Hall)
//	and an array of image URLs related to the Hall
class Hall {
	var hallName: String = ""
	var qwertyURL: String = ""
	var imageURLs: [String] = []
}

// a "Studio" has
//	a reference to the Database
//	a studioName (currently, the DataSnapshot key)
//	an array of Hall objects
//	an init() function which parses a DataSnapshot into Hall objects
class Studio {

    var ref: DatabaseReference!
	var studioName: String = ""
	var halls: [Hall] = []
	
    init(snapshot: DataSnapshot) {
		
		ref = snapshot.ref
		studioName = snapshot.key
		
        let value = snapshot.value as! NSDictionary
		
		// this loop assumes "value" is a Dictionary
		// where each Key is a Dictionary of "Hall" data
		// so we expect keys of "hall1", "hall2", "hall3", etc
		for k in value.allKeys {

			if let snap = value[k] as? NSDictionary {
			
				let newHall = Hall()
				newHall.hallName = snap["name"] as? String ?? ""
				newHall.qwertyURL = snap["qwerty"] as? String ?? ""
				
				if snap is [String: AnyObject] {
					
					for (_, value) in snap["images"] as! [String: AnyObject] {
						
						newHall.imageURLs.append(value as! String)
				
					}
					
				}
			
				halls.append(newHall)
				
			}
			
		}
	
	}
		
}

