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
            
            ZStack(alignment: .bottom) {
                ZStack(alignment: .topTrailing) {
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
                }
                VStack(alignment: .leading) {
                    Text(product.name)
                        .titleFont()
                        .lineLimit(1)
                    
                    Text("$\(product.price)")
                        .subtitle()
                }
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.background.opacity(0.5))
                .cornerRadius(10)
                .padding(10)
            }
        }
        .frame(height: UIScreen.main.bounds.width * 0.7)
       
    }
}

#Preview {
   MainView()
}
