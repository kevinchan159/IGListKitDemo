//
//  ViewController.swift
//  IGListKitDemo
//
//  Created by Kevin Chan on 8/26/18.
//  Copyright © 2018 Kevin Chan. All rights reserved.
//

import UIKit
import IGListKit

class ViewController: UIViewController, ProfessorSectionControllerDelegate {

    // Each collectionView should have a corresponding adapter
    var collectionView: UICollectionView!
    var adapter: ListAdapter!
    
    // Our array of data model objects. Every object should conform to ListDiffable
    var professors: [Professor]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "IGListKit Demo"
        view.backgroundColor = .white
        
        professors = [
            Professor(name: "Gates", image: #imageLiteral(resourceName: "billgates")),
            Professor(name: "Zuckerberg", image: #imageLiteral(resourceName: "zuckerberg")),
            Professor(name: "Gates #2", image: #imageLiteral(resourceName: "billgates")),
            Professor(name: "Zuckerberg # 2", image: #imageLiteral(resourceName: "zuckerberg")),
            Professor(name: "Gates #3", image: #imageLiteral(resourceName: "billgates")),
            Professor(name: "Zuckerberg # 3", image: #imageLiteral(resourceName: "zuckerberg"))
        ]
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        view.addSubview(collectionView)
        
        // This is the basic setup for an adapter
        adapter = ListAdapter(updater: ListAdapterUpdater(), viewController: self)
        adapter.collectionView = collectionView
        adapter.dataSource = self
        
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ])
    }
    
    // MARK: - ProfessorSectionControllerDelegate
    func didTapCell() {
        professors.append(Professor(name: "New Professor", image: #imageLiteral(resourceName: "billgates")))
        // The equivalent of reloadData() for regular collection views
        adapter.performUpdates(animated: true) { completed in
            // This is the code that is ran after the updates are done
            if (completed) {
                let lastIndexPath = IndexPath(item: 0, section: self.professors.count - 1)
                self.collectionView.scrollToItem(at: lastIndexPath, at: .centeredHorizontally, animated: true)
            }
        }
    }
}

extension ViewController: ListAdapterDataSource {
    // MARK: - ListAdapterDataSource
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        // Return the data model objects to use
        return professors
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        // Return the sectionController to be used for this object.
        // Note: This function is called for every single object returned in objects(for listAdapter: ListAdapter)
        // which means every object will have a corresponding sectionController
        return ProfessorSectionController(delegate: self)
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        // Usually just return nil
        return nil
    }
}

