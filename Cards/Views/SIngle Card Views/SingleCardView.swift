//  SingleCardView.swift
//  Cards
//  Created by Loi Ton on 2/11/26.

import SwiftUI

struct SingleCardView: View {
    @State private var currentModal: ToolbarSelection?
    @Binding var card: Card
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        NavigationStack {
            CardDetailView(card: $card)
                .modifier(CardToolbar(
                    currentModal: $currentModal,
                    card: $card))
                .onDisappear {
                    card.save()
                }
                .onChange(of: scenePhase) { newScenePhase in
                    if newScenePhase == .inactive {
                        card.save()
                    }
                }
        }
    }
}

struct SingleCardView_Previews: PreviewProvider {
    struct SingleCardPreview: View {
        @EnvironmentObject var store: CardStore
        var body: some View {
            SingleCardView(card: $store.cards[0])
        }
    }
    static var previews: some View {
        SingleCardPreview()
            .environmentObject(CardStore(defaultData: true))
    }
}
