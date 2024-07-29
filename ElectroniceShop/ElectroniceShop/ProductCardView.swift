//
//  ProductCardView.swift
//  ElectroniceShop
//
//  Created by Иван Незговоров on 29.07.2024.
//

import SwiftUI

struct ProductCardView: View {
    
    let product: Product
    
    var body: some View {
        
        // Geometry reader адаптивные размеры
        GeometryReader { geo in
            let size = geo.size
            
            ZStack(alignment: .topTrailing, content: {
                if let url = URL(string: product.image) {
                    CardImageView(url: url, width: size.width, height: size.height)
                    
                    Button {
                        // action
                    } label: {
                        Image(systemName: "heart.fill")
                            .padding(10)
                            .foregroundColor(product.isFavourite ? .red: .white)
                            .background(.black.opacity(0.2))
                            .clipShape(Circle())
                            .padding()
                    }
                }
            })
        }
        .frame(height: UIScreen.main.bounds.width * 0.7)
        .background(.background.opacity(0.5))
        .padding(10)
    }
}

#Preview {
    ProductCardView(
        product: Product(
            name: "DD",
            description: "DD",
            image: "https://firebasestorage.googleapis.com/v0/b/electronicshop-5ae0c.appspot.com/o/products%2Fvisionpro.png?alt=media&token=9abdf97a-0687-4622-a8d0-df86a3a6c631",
            price: 800,
            isFavourite: false
        )
    )
}
