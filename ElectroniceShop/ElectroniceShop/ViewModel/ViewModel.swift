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
        guard let id = product.id else { return }
        
        db.document(id).updateData(["isFavourite": !product.isFavourite])
        
    }
}
