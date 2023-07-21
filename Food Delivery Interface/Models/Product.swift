//
//  Product.swift
//  Japanese restaurant. Programmatically
//
//  Created by Kirill on 18.07.2023.
//

import UIKit

struct Product {
    var name: String
    var price: Int
    var image: UIImage
}

struct ProductGroup {
    var name: String
    var productsArray: [Product]
    var image: UIImage
}

struct Menu {
    var productsGroupsArray: [ProductGroup] = []
    
    private mutating func setUpMenu() -> Void {
        
        // Pizza
        let pizzaPriceRange = 400...700
        let getPizzaRandomPrice: (() -> Int) = { () -> Int in
            return Int.random(in: pizzaPriceRange)
        }
        let pizza1 = Product(name: "Пицца №1", price: getPizzaRandomPrice(), image: UIImage(named: "pizza1") ?? UIImage())
        let pizza2 = Product(name: "Пицца №2", price: getPizzaRandomPrice(), image: UIImage(named: "pizza2") ?? UIImage())
        let pizza3 = Product(name: "Пицца №3", price: getPizzaRandomPrice(), image: UIImage(named: "pizza3") ?? UIImage())
        let pizza4 = Product(name: "Пицца №4", price: getPizzaRandomPrice(), image: UIImage(named: "pizza4") ?? UIImage())
        let pizza5 = Product(name: "Пицца №5", price: getPizzaRandomPrice(), image: UIImage(named: "pizza5") ?? UIImage())
        
        // Sushi
        let sushiPriceRange = 300...700
        let getSushiRandomPrice: (() -> Int) = { () -> Int in
            return Int.random(in: sushiPriceRange)
        }
        let sushi1 = Product(name: "Суши №1", price: getSushiRandomPrice(), image: UIImage(named: "sushi1") ?? UIImage())
        let sushi2 = Product(name: "Суши №2", price: getSushiRandomPrice(), image: UIImage(named: "sushi2") ?? UIImage())
        let sushi3 = Product(name: "Суши №3", price: getSushiRandomPrice(), image: UIImage(named: "sushi3") ?? UIImage())
        let sushi4 = Product(name: "Суши №4", price: getSushiRandomPrice(), image: UIImage(named: "sushi4") ?? UIImage())
        let sushi5 = Product(name: "Суши №5", price: getSushiRandomPrice(), image: UIImage(named: "sushi5") ?? UIImage())
        
        // Burgers
        let burgersPriceRange = 400...700
        let getBurgerRandomPrice: (() -> Int) = { () -> Int in
            return Int.random(in: burgersPriceRange)
        }
        let burger1 = Product(name: "Бургер №1", price: getBurgerRandomPrice(), image: UIImage(named: "burger1") ?? UIImage())
        let burger2 = Product(name: "Бургер №2", price: getBurgerRandomPrice(), image: UIImage(named: "burger2") ?? UIImage())
        let burger3 = Product(name: "Бургер №3", price: getBurgerRandomPrice(), image: UIImage(named: "burger3") ?? UIImage())
        let burger4 = Product(name: "Бургер №4", price: getBurgerRandomPrice(), image: UIImage(named: "burger4") ?? UIImage())
        let burger5 = Product(name: "Бургер №5", price: getBurgerRandomPrice(), image: UIImage(named: "burger5") ?? UIImage())
        
        // Salad
        let saladPriceRange = 300...500
        let getSaladRandomPrice: (() -> Int) = { () -> Int in
            return Int.random(in: saladPriceRange)
        }
        let salad1 = Product(name: "Салат №1", price: getSaladRandomPrice(), image: UIImage(named: "salad1") ?? UIImage())
        let salad2 = Product(name: "Салат №2", price: getSaladRandomPrice(), image: UIImage(named: "salad2") ?? UIImage())
        let salad3 = Product(name: "Салат №3", price: getSaladRandomPrice(), image: UIImage(named: "salad3") ?? UIImage())
        let salad4 = Product(name: "Салат №4", price: getSaladRandomPrice(), image: UIImage(named: "salad4") ?? UIImage())
        
        // Soup
        let soupPriceRange = 300...500
        let getSoupRandomPrice: (() -> Int) = { () -> Int in
            return Int.random(in: soupPriceRange)
        }
        let soup1 = Product(name: "Суп №1", price: getSoupRandomPrice(), image: UIImage(named: "soup1") ?? UIImage())
        let soup2 = Product(name: "Суп №2", price: getSoupRandomPrice(), image: UIImage(named: "soup2") ?? UIImage())
        let soup3 = Product(name: "Суп №3", price: getSoupRandomPrice(), image: UIImage(named: "soup3") ?? UIImage())
        let soup4 = Product(name: "Суп №4", price: getSoupRandomPrice(), image: UIImage(named: "soup4") ?? UIImage())
        let soup5 = Product(name: "Суп №5", price: getSoupRandomPrice(), image: UIImage(named: "soup5") ?? UIImage())
        
        // Группы продуктов
        var pizzaGroup  = ProductGroup(name: "Пицца", productsArray: [], image: UIImage(named: "pizza") ?? UIImage())
        var sushiGroup  = ProductGroup(name: "Суши", productsArray: [], image: UIImage(named: "sushi") ?? UIImage())
        var burgerGroup = ProductGroup(name: "Бургеры", productsArray: [], image: UIImage(named: "burger") ?? UIImage())
        var saladGroup  = ProductGroup(name: "Салаты", productsArray: [], image: UIImage(named: "salad") ?? UIImage())
        var soupGroup   = ProductGroup(name: "Супы", productsArray: [], image: UIImage(named: "soup") ?? UIImage())

        
        // Добавление продуктов в группы
        pizzaGroup.productsArray.append(contentsOf: [pizza1, pizza2, pizza3, pizza4, pizza5])
        sushiGroup.productsArray.append(contentsOf: [sushi1, sushi2, sushi3, sushi4, sushi5])
        burgerGroup.productsArray.append(contentsOf: [burger1, burger2, burger3, burger4, burger5])
        saladGroup.productsArray.append(contentsOf: [salad1, salad2, salad3, salad4])
        soupGroup.productsArray.append(contentsOf: [soup1, soup2, soup3, soup4, soup5])
        
        // Добавление групп продуктов в массив групп продуктов
        self.productsGroupsArray.append(contentsOf: [pizzaGroup, sushiGroup, burgerGroup, saladGroup, soupGroup])
        
    }
    
    init() {
        self.setUpMenu()
    }
}
