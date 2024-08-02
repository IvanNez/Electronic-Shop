//
//  FavouritesView.swift
//  ElectroniceShop
//
//  Created by Иван Незговоров on 29.07.2024.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct FavouritesView: View {
    
    @FirestoreQuery(collectionPath: "shop",
                    predicates: [.isEqualTo("isFavourite", true )]) private var favouritesItems: [Product]
    var columns = Array(repeating: GridItem(), count: 2)
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(favouritesItems) { item in
                    NavigationLink(destination: EmptyView()) {
                        ProductCardView(product: item)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        .padding(.horizontal, 10)
        .background(.secondary.opacity(0.3))
        .navigationTitle("Favourites")
    }
}

#Preview {
    FavouritesView()
}
