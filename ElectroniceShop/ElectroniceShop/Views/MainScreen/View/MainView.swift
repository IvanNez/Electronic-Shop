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
    let hPadding: CGFloat = 10
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns) {
                    ForEach(items) { item in
                        NavigationLink(destination: DetailView(product: item)) {
                            ProductCardView(product: item)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .padding(.horizontal, hPadding)
            .background(.secondary.opacity(0.3))
            .shadow(color: .black.opacity(0.2), radius: 8, x: 5, y: 8)
            
            
            // MARK: Navigation bar
            .navigationTitle(Helper.Title.products)
            .toolbar {
                // left button
                ToolbarItem(placement: .topBarLeading) {
                    NavigationLink(destination: FavouritesView()) {
                        FavouritesButton()
                    }
                    .buttonStyle(.plain)
                }
                
                
                // right button
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: CartView()) {
                        CartButton(numberOfProducts: viewModel.cartItemCount)
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
