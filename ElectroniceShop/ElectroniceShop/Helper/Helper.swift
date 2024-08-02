//
//  Helper.swift
//  ElectroniceShop
//
//  Created by Иван Незговоров on 02.08.2024.
//

import Foundation

enum Helper {
    enum Title {
        static let products = "Products"
        static let favourites = "Favourites"
        static let cart = "Cart"
        
    }
    
    enum Firebase {
        static let shop = "shop"
        static let isFavourite = "isFavourite"
        static let quantityInCart = "quantityInCart"
    }
    
    enum Image {
        static let cart = "cart.fill"
        static let heart = "heart.fill"
        static let chevron = "chevron.left"
    }
    
    enum Button {
        static let buy = "Buy"
        static let cancel = "xmark.circle.fill"
        static let minus = "minus.rectangle.fill"
        static let plus = "plus.rectangle.fill"
        static let addCart = ""
    }
    
}
