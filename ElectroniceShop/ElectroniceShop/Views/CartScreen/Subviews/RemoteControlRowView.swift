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
            CustomRemoteControlButton(name: "xmark.circle.fill") {
                viewModel.removeFromCart(product: product)
            }
            
            HStack {
                CustomRemoteControlButton(name: "minus.rectangle.fill") {
                    viewModel.decreaseQuantity(product: product)
                }
                
                if let quantityInCart = product.quantityInCart {
                    Text("\(quantityInCart)")
                        .titleFont()
                }
                
                CustomRemoteControlButton(name: "plus.rectangle.fill") {
                    viewModel.increaseQuantity(product: product)
                }
            }
        }
        .padding()
    }
}
