//  CardsApp.swift
//  Cards
//  Created by Loi Ton on 2/11/26.

import SwiftUI

@main
struct CardsApp: App {
    @StateObject var store = CardStore()
    
    var body: some Scene {
        WindowGroup {
            CardsListView()
                .environmentObject(store)
                .onAppear {
                    print(URL.documentsDirectory)
                }
        }
    }
}
