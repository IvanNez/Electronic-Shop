//
//  ViewModel.swift
//  ElectroniceShop
//
//  Created by Иван Незговоров on 02.08.2024.
//

import Foundation
import FirebaseFirestore


final class ViewModel: ObservableObject {
    
    private let db = Firestore.firestore().collection("shop")
    
    func toggleFavourite(product: Product) {
        updateItem(product, data: ["isFavourite": !product.isFavourite])
    }
    
    func addToCart(product: Product) {
        updateItem(product, data: ["quantityInCart": 1])
    }
    
    func removeFromCart(product: Product) {
        updateItem(product, data: ["quantityInCart": 0])
    }
    
    func increaseQuantity(product: Product) {
        let newQuantity = (product.quantityInCart ?? 0) + 1
        updateItem(product, data: ["quantityInCart": newQuantity])
    }
    
    func decreaseQuantity(product: Product) {
        let currentQuantity = product.quantityInCart ?? 0
        let newQuantity = max(currentQuantity - 1, 1)
        updateItem(product, data: ["quantityInCart": newQuantity])
    }
    
    private func updateItem(_ product: Product, data: [String: Any]) {
        guard let id = product.id else { return }
        db.document(id).updateData(data)
    }
}
