//
//  ViewForGroupCell.swift
//  Japanese restaurant. Programmatically
//
//  Created by Kirill on 19.07.2023.
//

import UIKit

class ViewForGroupCell: UIView {
    
    private var imageView: UIImageView!
    private var nameLabel: UILabel!
    
    private func setUpSelf() -> Void {
        self.backgroundColor = .none
    }
    
    private func getImageView() -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        self.addSubview(imageView)
        return imageView
    }
    
    private func getNameLabel() -> UILabel {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25, weight: .light)
        self.addSubview(label)
        return label
    }
    
    private func addConstraintsToImageView() -> Void {
        self.imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2.5),
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            self.imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2.5),
            
            self.imageView.heightAnchor.constraint(equalToConstant: 45),
            self.imageView.widthAnchor.constraint(equalTo: self.imageView.heightAnchor, multiplier: 1)
        ])
    }
    
    private func addConstraintsToNameLabel() -> Void {
        self.nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.nameLabel.centerYAnchor.constraint(equalTo: self.imageView.centerYAnchor),
            self.nameLabel.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: 5),
            self.nameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)
        ])
    }
    
    func setUpNameLabelText(text: String) -> Void {
        self.nameLabel.text = text
    }
    
    func setUpImage(image: UIImage) -> Void {
        self.imageView.image = image.withTintColor(.systemYellow)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUpSelf()
        self.imageView = self.getImageView()
        self.nameLabel = self.getNameLabel()
        self.addConstraintsToImageView()
        self.addConstraintsToNameLabel()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
