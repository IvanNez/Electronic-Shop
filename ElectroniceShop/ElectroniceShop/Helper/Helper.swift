//
//  Helper.swift
//  ElectroniceShop
//
//  Created by Иван Незговоров on 02.08.2024.
//

import Foundation

enum Helper {
    enum Title {
        static let products = String(localized: "Products")
        static let favourites = String(localized: "Favourites")
        static let cart = String(localized: "Cart")
        
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
        static let buy = String(localized: "Buy")
        static let cancel = "xmark.circle.fill"
        static let minus = "minus.rectangle.fill"
        static let plus = "plus.rectangle.fill"
        static let addCart = ""
    }
    
}
