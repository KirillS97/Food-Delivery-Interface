//
//  GroupCell.swift
//  Japanese restaurant. Programmatically
//
//  Created by Kirill on 18.07.2023.
//

import UIKit

class GroupCell: UICollectionViewCell {
    
    static let reuseId = "GroupCell"
    
    var view: ViewForGroupCell!
    
    private func getViewForGroupCell() -> ViewForGroupCell {
        let viewForGroupCell = ViewForGroupCell(frame: CGRect.zero)
        self.addSubview(viewForGroupCell)
        return viewForGroupCell
    }
    
    private func addConstraintsToView() -> Void {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            self.view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.view = self.getViewForGroupCell()
        self.addConstraintsToView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
