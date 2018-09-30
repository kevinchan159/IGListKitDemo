//
//  EmptyStateCell.swift
//  IGListKitDemo
//
//  Created by Kevin Chan on 9/30/18.
//  Copyright © 2018 Kevin Chan. All rights reserved.
//

import UIKit

class EmptyStateCell: UICollectionViewCell {
    
    var emptyStateLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        emptyStateLabel = UILabel()
        emptyStateLabel.translatesAutoresizingMaskIntoConstraints = false
        emptyStateLabel.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        emptyStateLabel.textAlignment = .center
        emptyStateLabel.text = "EMPTY STATE"
        contentView.addSubview(emptyStateLabel)
        
        NSLayoutConstraint.activate([
            emptyStateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            emptyStateLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
