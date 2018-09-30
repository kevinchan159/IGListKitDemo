//
//  EmptyStateSectionController.swift
//  IGListKitDemo
//
//  Created by Kevin Chan on 9/30/18.
//  Copyright © 2018 Kevin Chan. All rights reserved.
//

import IGListKit

protocol EmptyStateSectionControllerDelegate {
    func emptyStateCellWasTapped()
}

class EmptyStateSectionController: ListSectionController {
    
    var emptyStateModel: EmptyStateModel!
    var delegate: EmptyStateSectionControllerDelegate!
    
    init(delegate: EmptyStateSectionControllerDelegate) {
        self.delegate = delegate
    }
    
    // MARK: - ListSectionController overrides
    override func sizeForItem(at index: Int) -> CGSize {
        guard let containerSize = collectionContext?.containerSize else {
            return .zero
        }
        return containerSize
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext?.dequeueReusableCell(of: EmptyStateCell.self, for: self, at: index) as! EmptyStateCell
        return cell
    }
    
    override func didUpdate(to object: Any) {
        emptyStateModel = object as? EmptyStateModel
    }
    
    override func didSelectItem(at index: Int) {
        delegate.emptyStateCellWasTapped()
    }
    
}
