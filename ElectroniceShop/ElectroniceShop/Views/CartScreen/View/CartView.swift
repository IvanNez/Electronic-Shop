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
    
    @FirestoreQuery(collectionPath: "shop") private var items: [Product]
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(items.filter({$0.quantityInCart ?? 0 > 0})) { item in
                    ProductRow(product: item)
                }
            }
            
            Text("Total: \(items.count)")
                .titleFont()
                .padding(.bottom, 20)
            CustomMainButton(title: "Buy") {
                
            }
            .padding(.horizontal, 30)
        }
        .navigationTitle("Cart")
        .background(.secondary.opacity(0.3))
    }
}

#Preview {
    CartView()
}
