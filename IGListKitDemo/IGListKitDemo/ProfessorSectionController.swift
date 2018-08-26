//
//  ProfessorSectionController.swift
//  IGListKitDemo
//
//  Created by Kevin Chan on 8/26/18.
//  Copyright © 2018 Kevin Chan. All rights reserved.
//

import Foundation
import IGListKit

protocol ProfessorSectionControllerDelegate {
    func didTapCell()
}

class ProfessorSectionController: ListSectionController {
    
    private var professor: Professor!
    private var delegate: ProfessorSectionControllerDelegate!
    
    init(delegate: ProfessorSectionControllerDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - ListSectionController overrides
    override func numberOfItems() -> Int {
        // Here we return just 1 cell. However, we could return more than 1 if needed
        return 1
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        // Notice that the dequeue function is slightly different
        let cell = collectionContext?.dequeueReusableCell(of: ProfessorCell.self, for: self, at: index) as! ProfessorCell
        cell.configure(for: professor)
        cell.setNeedsUpdateConstraints()
        
        return cell
    }
    
    // This is the object that is associated with this sectionController
    // Note: This is an object from objects(for listAdapter: ListAdapter) from ViewController
    override func didUpdate(to object: Any) {
        // Here, you probably want to have a variable to store this object since you may need it
        // in cellForItemAt
        
        // After this function, sizeForItem and cellForItem is automatically called.
        // These functions are all called automatically. You don't need to call them yourself
        self.professor = object as? Professor
    }
    
    override func didSelectItem(at index: Int) {
        delegate.didTapCell()
    }
}
