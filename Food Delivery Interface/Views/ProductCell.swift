//
//  ProductCell.swift
//  Japanese restaurant. Programmatically
//
//  Created by Kirill on 18.07.2023.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    static let reuseId: String = "ProductCell"
    
    var view: ViewForProductCell!
    
    private func setUpView() -> ViewForProductCell {
        let viewForProductCell = ViewForProductCell()
        self.addSubview(viewForProductCell)
        return viewForProductCell
    }
    
    private func addConstraintsToView() -> Void {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.view.productImageView.topAnchor.constraint(equalTo: self.topAnchor),
            self.view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.view.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            self.view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.view = self.setUpView()
        self.addConstraintsToView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
