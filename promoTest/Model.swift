//
//  Model.swift
//  promoTest
//
//  Created by Дмитрий Деникаев on 20.09.17.
//  Copyright © 2017 Dmitriy Denikaev. All rights reserved.
//

import Foundation
import Firebase

class Model {
    
    var image: String
    var image2: String
    var images: [String] = []
    var images2: [String] = []
    var ref: DatabaseReference!
    
    init(snapshot: DataSnapshot) {
        ref = snapshot.ref
        let value = snapshot.value as! NSDictionary
        let snap = value["hall1"] as? NSDictionary
        let snap2 = value["hall2"] as? NSDictionary
        image = snap?["qwerty"] as? String ?? ""
        image2 = snap2?["qwerty"] as? String ?? ""
        if let post1 = snap as? [String: AnyObject] {
            for (_, value) in post1["images"] as! [String: AnyObject] {
                self.images.append(value as! String)
            }
        }
        if let post1 = snap2 as? [String: AnyObject] {
            for (_, value) in post1["images"] as! [String: AnyObject] {
                self.images2.append(value as! String)
            }
        }
    }
}

