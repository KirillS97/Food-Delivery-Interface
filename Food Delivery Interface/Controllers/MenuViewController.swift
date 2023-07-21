//
//  MenuViewController.swift
//  Japanese restaurant. Programmatically
//
//  Created by Kirill on 18.07.2023.
//

import UIKit

class MenuViewController: UIViewController {
    
    
    
    // MARK: - Properties
    /*= = = = = = = = = = = = = = = = = = = = = = = =*/
    var productCollection      : UICollectionView!
    var groupCollection        : UICollectionView!
    var menu                   : Menu!
    var selectedProductsGroup  : Int = 0 // Выбранная группа товаров
    /*= = = = = = = = = = = = = = = = = = = = = = = =*/
    
    
    
    // MARK: - viewDidLoad
    /*= = = = = = = = = = = = = = = = = = = = = = = =*/
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // MARK: Настройка модели-меню
        /* - - - - - - - - - - - - - - - - - - */
        self.menu = Menu()
        /* - - - - - - - - - - - - - - - - - - */
        
        
        
        // MARK: Настройка цвета корневого вью
        /* - - - - - - - - - - - - - - - - - - */
        self.view.backgroundColor = UIColor(cgColor: CGColor(red: 27/255, green: 27/255, blue: 27/255, alpha: 1))
        /* - - - - - - - - - - - - - - - - - - */
        
        
        
        // MARK: Настройка коллекции групп товаров
        /* - - - - - - - - - - - - - - - - - - */
        // Настройка компоновки коллекции
        let groupCollectionFlowLayout = UICollectionViewFlowLayout()
        groupCollectionFlowLayout.scrollDirection = .horizontal
        groupCollectionFlowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        groupCollectionFlowLayout.minimumLineSpacing = 0
        
        // Обязательно приравниваем эти значения, чтобы размер контента был правильным
        groupCollectionFlowLayout.minimumInteritemSpacing = groupCollectionFlowLayout.minimumLineSpacing
        
        // Инициализация
        self.groupCollection = UICollectionView(frame: .zero, collectionViewLayout: groupCollectionFlowLayout)
        
        // Добавление в иерархию графических элементов
        self.view.addSubview(self.groupCollection)
        
        // Настройка цвета
        self.groupCollection.backgroundColor = .none
        
        // Отключение полос прокрутки
        self.groupCollection.showsVerticalScrollIndicator = false
        self.groupCollection.showsHorizontalScrollIndicator = false
        
        // Отключение автоматических ограничения
        self.groupCollection.translatesAutoresizingMaskIntoConstraints = false
        
        // Установка ограничений
        NSLayoutConstraint.activate([
            self.groupCollection.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.groupCollection.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.groupCollection.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            
            self.groupCollection.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        // Присвоение значениий для делегата и источника данных
        self.groupCollection.dataSource = self
        self.groupCollection.delegate = self
        
        // Регистрация ячейки
        self.groupCollection.register(GroupCell.self, forCellWithReuseIdentifier: GroupCell.reuseId)
        /* - - - - - - - - - - - - - - - - - - */
        
        
        
        // MARK: Настройка коллекции товаров
        /* - - - - - - - - - - - - - - - - - - */
        // Настройка компоновки коллекции
        let productCollectionFlowLayout = UICollectionViewFlowLayout()
        productCollectionFlowLayout.scrollDirection = .vertical
        productCollectionFlowLayout.minimumLineSpacing = 20
        productCollectionFlowLayout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        
        // Инициализация
        self.productCollection = UICollectionView(frame: .zero, collectionViewLayout: productCollectionFlowLayout)
        
        // Добавление в иерархию графических элементов
        self.view.addSubview(self.productCollection)
        
        // Настройка цвета
        self.productCollection.backgroundColor = .none
        
        // Отключение полос прокрутки
        self.productCollection.showsVerticalScrollIndicator = false
        self.productCollection.showsHorizontalScrollIndicator = false
        
        // Отключение автоматических ограничения
        self.productCollection.translatesAutoresizingMaskIntoConstraints = false
        
        // Установка ограничений
        NSLayoutConstraint.activate([
            self.productCollection.topAnchor.constraint(equalTo: self.groupCollection.bottomAnchor),
            self.productCollection.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            self.productCollection.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.productCollection.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        // Присвоение значениий для делегата и источника данных
        self.productCollection.dataSource = self
        self.productCollection.delegate = self
        
        // Регистрация ячейки
        self.productCollection.register(ProductCell.self, forCellWithReuseIdentifier: ProductCell.reuseId)
        
        // Страничный режим
        self.productCollection.isPagingEnabled = true
        /* - - - - - - - - - - - - - - - - - - */
        
    }
    /*= = = = = = = = = = = = = = = = = = = = = = = =*/
    
    
}



extension MenuViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.groupCollection {
            return self.menu.productsGroupsArray.count
        } else {
            return self.menu.productsGroupsArray[self.selectedProductsGroup].productsArray.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.productCollection {
            if let cell = self.productCollection.dequeueReusableCell(withReuseIdentifier: ProductCell.reuseId,
                                                                  for: indexPath) as? ProductCell {
                if self.menu.productsGroupsArray[self.selectedProductsGroup].productsArray.count > indexPath.item {
                    let product = self.menu.productsGroupsArray[self.selectedProductsGroup].productsArray[indexPath.item]
                    
                    let productName : String = product.name
                    let productPrice: Int = product.price
                    let productImage: UIImage = product.image
                    
                    cell.view.setUpImage(image: productImage)
                    cell.view.setUpNameLabelText(text: productName)
                    cell.view.setUpPriceLabelText(text: "\(productPrice) р.")
                    
                }
                return cell
            }
        } else if collectionView == self.groupCollection {
            if let cell = self.groupCollection.dequeueReusableCell(withReuseIdentifier: GroupCell.reuseId, for: indexPath) as? GroupCell {
                if self.menu.productsGroupsArray.count > indexPath.item {
                    let productGroup = self.menu.productsGroupsArray[indexPath.item]
                    cell.view.setUpImage(image: productGroup.image)
                    cell.view.setUpNameLabelText(text: productGroup.name)
                }
                return cell
            }
        }
        let cell = UICollectionViewCell()
        cell.backgroundColor = .systemBlue
        return cell
    }
    
}



extension MenuViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == self.groupCollection {
            self.selectedProductsGroup = indexPath.item
            self.productCollection.scrollToItem(at: IndexPath(item: 0, section: indexPath.section),
                                                at: .left,
                                                animated: false)
            self.productCollection.reloadData()
        } else if collectionView == self.productCollection {
            guard self.menu.productsGroupsArray.count > self.selectedProductsGroup else { return }
            guard self.menu.productsGroupsArray[self.selectedProductsGroup].productsArray.count > indexPath.item else { return }
            
            let product = self.menu.productsGroupsArray[self.selectedProductsGroup].productsArray[indexPath.item]
            let productVC = ProductViewController()
            
            productVC.setUpImage(image: product.image)
            productVC.setUpName(name: product.name)
            productVC.setUpPrice(price: product.price)
            
            self.present(productVC, animated: true)
        }
    }
    
}



extension MenuViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == self.productCollection {
            return CGSize(width: self.productCollection.bounds.width, height: 150)
        }
        
        return CGSize.init(width: self.groupCollection.bounds.height, height: self.groupCollection.bounds.height)
    }
}
