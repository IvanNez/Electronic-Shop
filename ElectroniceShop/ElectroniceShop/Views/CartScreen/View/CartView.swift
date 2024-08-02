//
//  CartView.swift
//  ElectroniceShop
//
//  Created by Иван Незговоров on 29.07.2024.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct CartView: View {
    
    @FirestoreQuery(collectionPath: "shop",
                    predicates: [.isEqualTo("isFavourite", true )]) private var favouritesItems: [Product]
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                
            }
        }
        .navigationTitle("Cart")
    }
}

#Preview {
    CartView()
}
