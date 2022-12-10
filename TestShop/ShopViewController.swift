//
//  ViewController.swift
//  TestShop
//
//  Created by Artem Pavlov on 08.12.2022.
//

import UIKit

class ShopViewController: UIViewController {
    
    enum Section: Int, CaseIterable {
        case category
    }
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Int>?
    var collectionView: UICollectionView!
    
    let categories = DataManager.shared.getCategories()
    
    private lazy var categoryRange: ClosedRange<Int> = 1...categories.count
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupCollectionView()
        createDataSource()
        reloadData()
        
        
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionalLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = #colorLiteral(red: 0.968627451, green: 0.9725490196, blue: 0.9921568627, alpha: 1)
        view.addSubview(collectionView)
        
        collectionView.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reuseId)        
    }
    
    // MARK: - Manage the data
    func createDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Int>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, identifier: Int) -> UICollectionViewCell? in
            
          //  if self.categoryRange ~= identifier {
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reuseId, for: indexPath) as? CategoryCell
                let category = self.categories[indexPath.row]
                cell?.configure(with: category)
                return cell
          //  }
        }
        
        )
    }
    
    func reloadData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Int>()
        let sections: [Section] = Section.allCases
        snapshot.appendSections([sections[0]])
        snapshot.appendItems(Array(categoryRange))
//        snapshot.appendSections(Section.allCases)
//
//        for section in Section.allCases {
//            snapshot.appendItems(section.items, toSection: section)
//        }
        
        dataSource?.apply(snapshot)
    }
    
    // MARK: - Setup Layout
    func createCompositionalLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            let section = Section.allCases[sectionIndex]
            
            switch section {
            case .category:
                return self.createCategorySection()
            }
        }
        
        return layout
    }
    
    func createCategorySection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 8, bottom: 0, trailing: 8)
        
        let layoutGroupSize = NSCollectionLayoutSize(widthDimension: .estimated(104),
                                                     heightDimension: .estimated(88))
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: layoutGroupSize, subitems: [layoutItem])
        
        let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
        layoutSection.orthogonalScrollingBehavior = .continuous
        layoutSection.contentInsets = NSDirectionalEdgeInsets.init(top: 66, leading: 12, bottom: 0, trailing: 12)
        
        return layoutSection
    }


}

