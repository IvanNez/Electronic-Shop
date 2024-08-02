//
//  ProductRo.swift
//  ElectroniceShop
//
//  Created by Иван Незговоров on 02.08.2024.
//

import SwiftUI

struct ProductRow: View {
    
    let product: Product
    
    var body: some View {
        
        ZStack(alignment: .trailing) {
            HStack(spacing: 20) {
                if let url = URL(string: product.image) {
                    CardImageView(url: url, width: 100, height: 100)
                }
                
                VStack(alignment: .leading, spacing: 20) {
                    Text(product.name)
                    
                    if let quantityInCart = product.quantityInCart {
                        Text("$\(product.price * quantityInCart)")
                    }
                   
                }
                
                Spacer()
            }
            .padding(10)
            .background(.background)
            .cornerRadius(20)
            
            RemoteControlRowView(product: product)
            
        }
        .shadow(color: .black.opacity(0.3), radius: 7, x: 5, y: 4)
        .padding(.horizontal, 10)
        
    }
}

#Preview {
  ProductRow(product:  Product(name: "Iphone 15 pro",
                               description: "iPhone 15 Pro is the first iPhone to feature an aerospace‑grade titanium design, using the same alloy that spacecraft use for missions to Mars.",
                               image: "https://firebasestorage.googleapis.com/v0/b/electronicshop-5ae0c.appspot.com/o/products%2Fiphone15.jpeg?alt=media&token=e8e13761-3df9-408a-a1d8-4e0fd3114c44",
                               price: 999,
                               isFavourite: false, quantityInCart: 4))
}


