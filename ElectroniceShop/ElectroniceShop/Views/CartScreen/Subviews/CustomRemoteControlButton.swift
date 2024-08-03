//
//  CustomRemoteControlButton.swift
//  ElectroniceShop
//
//  Created by Иван Незговоров on 02.08.2024.
//

import SwiftUI

struct CustomRemoteControlButton: View {
    
    let name: String
    let action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: name)
                .foregroundColor(.primary)
                .font(.title)
            
        }
        .buttonStyle(.plain)
    }
}


