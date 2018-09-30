//
//  ProfessorCell.swift
//  IGListKitDemo
//
//  Created by Kevin Chan on 8/26/18.
//  Copyright © 2018 Kevin Chan. All rights reserved.
//

import UIKit

// NOTE: THIS IS SAME AS ANY OTHER COLLECTION VIEW CELL.
// Nothing new needs to be done
class ProfessorCell: UICollectionViewCell {
    
    var nameLabel: UILabel!
    var photoImageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        contentView.addSubview(nameLabel)
        
        photoImageView = UIImageView(frame: .zero)
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.contentMode = .scaleAspectFit
        contentView.addSubview(photoImageView)
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
            ])
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            photoImageView.widthAnchor.constraint(equalToConstant: 100),
            photoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
            ])
        super.updateConstraints()
    }
    
    func configure(for professor: Professor) {
        nameLabel.text = professor.name
        photoImageView.image = professor.image
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
