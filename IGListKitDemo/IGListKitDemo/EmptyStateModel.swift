//
//  EmptyStateModel.swift
//  IGListKitDemo
//
//  Created by Kevin Chan on 9/30/18.
//  Copyright © 2018 Kevin Chan. All rights reserved.
//

import IGListKit

class EmptyStateModel: ListDiffable {
    
    let identifier = UUID().uuidString
    
    func diffIdentifier() -> NSObjectProtocol {
        return identifier as NSString
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if (self === object) {
            // Return true if they are the same instance
            return true
        }
        guard let object = object as? EmptyStateModel else {
            // If the object is not of Professor class, return false
            return false
        }
        return identifier == object.identifier
    }
    
}
