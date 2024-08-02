//
//  RemoteControlRowView.swift
//  ElectroniceShop
//
//  Created by Иван Незговоров on 02.08.2024.
//

import SwiftUI

struct RemoteControlRowView: View {
    
    let product: Product
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 25) {
            Button {
                
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title2)
            }
            .buttonStyle(.plain)
            
            HStack {
                Button {
                    
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
