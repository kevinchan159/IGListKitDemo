//
//  ViewController.swift
//  IGListKitDemo
//
//  Created by Kevin Chan on 8/26/18.
//  Copyright © 2018 Kevin Chan. All rights reserved.
//

import UIKit
import IGListKit

class ViewController: UIViewController {

    // Each collectionView should have a corresponding adapter
    // The adapter's job is to receive the array of data model objects and break them
    // into individual section controllers
    var collectionView: UICollectionView!
    var adapter: ListAdapter!
    
    // Our array of data model objects. Every object should conform to ListDiffable
    var professors: [Professor]!
    var isEmptyState = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        title = "IGListKit Demo"
        view.backgroundColor = .white
        
        professors = [
            Professor(name: "Gates", image: #imageLiteral(resourceName: "billgates")),
            Professor(name: "Gates #2", image: #imageLiteral(resourceName: "billgates")),
            Professor(name: "Gates #3", image: #imageLiteral(resourceName: "billgates")),
            Professor(name: "Gates #4", image: #imageLiteral(resourceName: "billgates")),
            Professor(name: "Gates #5", image: #imageLiteral(resourceName: "billgates")),
            Professor(name: "Gates #6", image: #imageLiteral(resourceName: "billgates"))
        ]
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
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

}

extension ViewController: ListAdapterDataSource {
    // MARK: - ListAdapterDataSource
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        // Return the data model objects to use
        return isEmptyState ? [EmptyStateModel()] : professors
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        // Return the sectionController to be used for this object.
        // Note: This function is called for every single object returned in objects(for listAdapter: ListAdapter)
        // which means every object will have a corresponding sectionController
        if object is Professor {
            return ProfessorSectionController(delegate: self)
        } else {
            return EmptyStateSectionController(delegate: self)
        }
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        // Usually just return nil
        return nil
    }
}

extension ViewController: ProfessorSectionControllerDelegate {
    func professorCellWasSelected() {
        isEmptyState = true
        adapter.performUpdates(animated: true, completion: nil)
    }
}

extension ViewController: EmptyStateSectionControllerDelegate {
    func emptyStateCellWasTapped() {
        isEmptyState = false
        adapter.performUpdates(animated: true, completion: nil)
    }
}
