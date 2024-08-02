//
//  RemoteControlRowView.swift
//  ElectroniceShop
//
//  Created by Иван Незговоров on 02.08.2024.
//

import SwiftUI

struct RemoteControlRowView: View {
    
    let product: Product
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 25) {
            Button {
                viewModel.removeFromCart(product: product)
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title2)
            }
            .buttonStyle(.plain)
            
            HStack {
                Button {
                    viewModel.decreaseQuantity(product: product)
                } label: {
                    Image(systemName: "minus.rectangle.fill")
                        .foregroundColor(.primary)
                        .font(.title)
                    
                }
                .buttonStyle(.plain)
                
                if let quantityInCart = product.quantityInCart {
                    Text("\(quantityInCart)")
                        .titleFont()
                }
                
                Button {
                    viewModel.increaseQuantity(product: product)
                } label: {
                    Image(systemName: "plus.rectangle.fill")
                        .foregroundColor(.primary)
                        .font(.title)
                    
                }
                .buttonStyle(.plain)
            }
        }
        .padding()
    }
}
