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
    @Published var cartItems: [Product] = []
    
    var cartItemCount: Int {
        cartItems.filter({ $0.quantityInCart ?? 0 > 0}).count
    }
    
    var totalPrice: Int {
        cartItems.reduce(0) { total, item in
            total + (item.price * (item.quantityInCart ?? 0))
        }
    }
    
    init() {
        fetchItems()
    }
    
    private func fetchItems() {
        db.addSnapshotListener { snapshot, error in
            if let error = error {
                print("Error fetching documents: \(error.localizedDescription)")
            } else {
                self.cartItems = snapshot?.documents.compactMap { document in
                    try? document.data(as: Product.self)
                } ?? []
            }
        }
    }
    
    
    
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
