//  CardsApp.swift
//  Cards
//  Created by Loi Ton on 2/11/26.

import SwiftUI

@main
struct CardsApp: App {
    @StateObject var store = CardStore(defaultData: false)
    
    var body: some Scene {
        WindowGroup {
            AppLoadingView()
                .environmentObject(store)
                .onAppear {
                    print(URL.documentsDirectory)
                }
        }
    }
}
