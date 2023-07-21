//
//  ProductViewController.swift
//  Japanese restaurant. Programmatically
//
//  Created by Kirill on 20.07.2023.
//

import UIKit

class ProductViewController: UIViewController {

    override func loadView() {
        self.view = ViewForProductVC()
    }

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        if let view = view as? ViewForProductVC  {
//            view.setUpImage(image: UIImage(named: "pizza1") ?? UIImage())
//            view.setUpNameLabelText(text: "Pizza")
//            view.setUpPriceLabelText(text: "500 р.")
//        }
//    }
    
    func setUpImage(image: UIImage) -> Void {
        guard let view = view as? ViewForProductVC else { return }
        view.setUpImage(image: image)
    }
    
    func setUpName(name: String) -> Void {
        guard let view = view as? ViewForProductVC else { return }
        view.setUpNameLabelText(text: name)
    }
    
    func setUpPrice(price: Int) -> Void {
        guard let view = view as? ViewForProductVC else { return }
        view.setUpPriceLabelText(text: "\(price) р.")
    }
    
}
