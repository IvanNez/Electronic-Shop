//
//  ContentView.swift
//  ElectroniceShop
//
//  Created by Иван Незговоров on 29.07.2024.
//

import SwiftUI
import FirebaseFirestoreSwift
import FirebaseFirestore

struct MainView: View {
    
    @FirestoreQuery(collectionPath: "shop") var items: [Product]
    
    var body: some View {
        List {
            ForEach(items) { item in
                HStack {
                    Text(item.name)
                    Text("\(item.price)")
                }
            } .padding(.leading, 20)
        }
    }
}

#Preview {
    MainView()
}
