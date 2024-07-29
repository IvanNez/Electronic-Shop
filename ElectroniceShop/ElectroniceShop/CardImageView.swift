//
//  CardImageView.swift
//  ElectroniceShop
//
//  Created by Иван Незговоров on 29.07.2024.
//

import SwiftUI

struct CardImageView: View {
    
    let url: URL
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        // Download image in firebase
        AsyncImage(url: url) { image in
            image
                .resizable() // размер будем настраивать
                .scaledToFill() // растягиваем сохраняя пропорции
                .frame(width: width, height: height) // размер
                .clipShape(RoundedRectangle(cornerRadius: 20)) // обрезаем по закругленному крадрату с радиусом 20
        } placeholder: {
            ProgressView()
                .frame(width: width, height: height)
        }
    }
}

