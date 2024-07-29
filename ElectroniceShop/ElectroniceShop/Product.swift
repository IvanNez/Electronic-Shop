//
//  Product.swift
//  ElectroniceShop
//
//  Created by Иван Незговоров on 29.07.2024.
//

import Foundation
import FirebaseFirestoreSwift

struct Product: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var description: String
    var image: String
    var price: Int
    var isFavourite: Bool
    var quantityInCart: Int?
    
    
}
