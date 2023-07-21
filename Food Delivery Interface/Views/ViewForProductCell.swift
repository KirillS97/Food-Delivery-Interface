//
//  ViewForProductCell.swift
//  Japanese restaurant. Programmatically
//
//  Created by Kirill on 20.07.2023.
//

import UIKit

class ViewForProductCell: UIView {
    
    var productImageView   : UIImageView!
    private var nameLabel  : UILabel!
    private var priceLabel : UILabel!
    
    private func setUpSelf() -> Void {
        self.layer.cornerRadius = 25
        self.backgroundColor = .systemYellow
    }
    
    private func getImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        return imageView
    }
    
    private func getLabel(font: UIFont) -> UILabel {
        let label = UILabel()
        label.textAlignment = .natural
        label.numberOfLines = 2
        label.textColor = .black
        label.font = font
        self.addSubview(label)
        return label
    }
    
    private func addConstraintsToProductImageView() -> Void {
        self.productImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.productImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: -20),
            self.productImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: -15),
            self.productImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            self.productImageView.widthAnchor.constraint(equalTo: self.productImageView.heightAnchor, multiplier: 1)
        ])
    }
    
    private func addConstraintsToNameLabel() -> Void {
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.nameLabel.bottomAnchor.constraint(equalTo: self.centerYAnchor, constant: -5),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.productImageView.trailingAnchor, constant: 20),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
    }
    
    private func addConstraintsToPriceLabel() -> Void {
        self.priceLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.priceLabel.leadingAnchor.constraint(equalTo: self.nameLabel.leadingAnchor),
            self.priceLabel.trailingAnchor.constraint(equalTo: self.nameLabel.trailingAnchor),
            self.priceLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor, constant: 10)
        ])
    }
    
    func setUpImage(image: UIImage) -> Void {
        self.productImageView.image = image
    }
    
    func setUpNameLabelText(text: String) -> Void {
        self.nameLabel.text = text
    }
    
    func setUpPriceLabelText(text: String) -> Void {
        self.priceLabel.text = text
    }
    
    init() {
        super.init(frame: CGRect.zero)
        self.setUpSelf()
        self.productImageView = self.getImageView()
        self.nameLabel = self.getLabel(font: .systemFont(ofSize: 30, weight: .regular))
        self.priceLabel = self.getLabel(font: .systemFont(ofSize: 25, weight: .light))
        self.addConstraintsToProductImageView()
        self.addConstraintsToNameLabel()
        self.addConstraintsToPriceLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
