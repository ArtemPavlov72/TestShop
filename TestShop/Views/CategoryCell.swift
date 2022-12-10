//
//  LocationCell.swift
//  TestShop
//
//  Created by Artem Pavlov on 09.12.2022.
//

import Foundation
import UIKit

class CategoryCell: UICollectionViewCell {
    
    static var reuseId: String = "CategoryCell"
    
    let categoryImageView = UIImageView()
    let categoryName = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(white: 1, alpha: 1)
        setupElements()
        setupConstraints()

        categoryImageView.frame = self.bounds
        addSubview(categoryImageView)
        self.layer.cornerRadius = 4
        self.clipsToBounds = true
    }
    
    func setupElements() {
        categoryName.translatesAutoresizingMaskIntoConstraints = false
        categoryImageView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func configure(with category: Category) {
        categoryName.text = category.name
        categoryImageView.image = UIImage(systemName: category.picture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Setup Constraints
extension CategoryCell {
    func setupConstraints() {
        addSubview(categoryName)
        addSubview(categoryImageView)
        
        categoryImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        categoryImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        categoryImageView.widthAnchor.constraint(equalToConstant: 78).isActive = true
        categoryImageView.heightAnchor.constraint(equalToConstant: 78).isActive = true
        
        categoryName.topAnchor.constraint(equalTo: categoryImageView.bottomAnchor, constant: 8).isActive = true
        categoryName.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        categoryName.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
}
