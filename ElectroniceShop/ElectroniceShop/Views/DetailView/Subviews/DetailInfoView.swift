//
//  DetailInfoView.swift
//  ElectroniceShop
//
//  Created by Иван Незговоров on 02.08.2024.
//

import SwiftUI

struct DetailInfoView: View {
    
    let product: Product
    @EnvironmentObject var viewModel: ViewModel
    let action: () -> ()

    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            HStack {
                Text(product.name)
                    .titleFont()
                Spacer()
                Text("$\(product.price)")
                    .titleFont()
            }
            
            Text(product.description)
                .subtitle()
                .fixedSize(horizontal: false, vertical: true)
                .lineLimit(6)
            
            Spacer()
            
            CustomMainButton(title: String(localized: "Add_To_Cart"), action: {
                viewModel.addToCart(product: product)
                action()
            })
            
        }
        .padding(.horizontal, 30)
    }
}

