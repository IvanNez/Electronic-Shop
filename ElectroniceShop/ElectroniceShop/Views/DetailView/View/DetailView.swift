//
//  DetailView.swift
//  ElectroniceShop
//
//  Created by Иван Незговоров on 02.08.2024.
//

import SwiftUI

struct DetailView: View {
    
    let product: Product
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack(alignment: .topLeading)
         {
            VStack {
                if let url = URL(string: product.image) {
                    CardImageView(url: url, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height / 1.7)
                        .shadow(color: .black.opacity(0.3), radius: 10, x: 5, y: 8)
                        .ignoresSafeArea()
                }
                
                DetailInfoView(product: product) {
                    dismiss()
                }
            }
            .background(.secondary.opacity(0.3))
            .navigationBarBackButtonHidden()
             BackButtonView()
                 .padding(.leading)
        }
    }
}

#Preview {
    DetailView(product: Product(name: "Iphone 15 pro",
                                description: "iPhone 15 Pro is the first iPhone to feature an aerospace‑grade titanium design, using the same alloy that spacecraft use for missions to Mars.",
                                image: "https://firebasestorage.googleapis.com/v0/b/electronicshop-5ae0c.appspot.com/o/products%2Fiphone15.jpeg?alt=media&token=e8e13761-3df9-408a-a1d8-4e0fd3114c44",
                                price: 999,
                                isFavourite: false))
    .environmentObject(ViewModel())
}


