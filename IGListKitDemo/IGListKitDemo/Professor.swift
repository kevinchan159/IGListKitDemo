//
//  Professor.swift
//  IGListKitDemo
//
//  Created by Kevin Chan on 8/26/18.
//  Copyright © 2018 Kevin Chan. All rights reserved.
//

import Foundation
import IGListKit

class Professor {
    
    var name: String
    var image: UIImage
    let identifier: String = UUID().uuidString
    
    init(name: String, image: UIImage) {
        self.name = name
        self.image = image
    }
    
}

extension Professor: ListDiffable {
    // To conform to ListDiffable, you must simply conform to these methods
    
    // Should be unique for each instance and should never be changed
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSString
    }
    
    // Here, implement your equality check
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if (self === object) {
            // Return true if they are the same instance
            return true
        }
        guard let object = object as? Professor else {
            // If the object is not of Professor class, return false
            return false
        }
        return identifier == object.identifier
    }
}
