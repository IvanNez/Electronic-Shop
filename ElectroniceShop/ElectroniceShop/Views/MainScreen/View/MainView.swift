//
//  ContentView.swift
//  ElectroniceShop
//
//  Created by Иван Незговоров on 29.07.2024.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseFirestore

struct MainView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    @FirestoreQuery(collectionPath: "shop") var items: [Product]
    var columns = Array(repeating: GridItem(), count: 2)
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(items) { item in
                        ProductCardView(product: item)
                    }
                }
            }
            .padding(.horizontal, 10)
            .background(.secondary.opacity(0.3))
            .shadow(color: .black.opacity(0.2), radius: 8, x: 5, y: 8)
            
            
            // MARK: Navigation var
            .navigationTitle("Products")
            .toolbar {
                // left button
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: FavouritesView()) {
                        Image(systemName: "heart.fill")
                            .font(.title2)
                    }
                    .buttonStyle(.plain)
                }
                
                
                // right button
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: CartView()) {
                        Image(systemName: "cart.fill")
                            .font(.title2)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

#Preview {
    MainView()
        .environmentObject(ViewModel())
}
