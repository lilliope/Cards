//  CardDetailView.swift
//  Cards
//  Created by Loi Ton on 2/12/26.

import SwiftUI

struct CardDetailView: View {
    @EnvironmentObject var store: CardStore
    @Binding var card: Card
    
    var body: some View {
        ZStack {
            card.backgroundColor
            ForEach($card.elements, id: \.id) { $element in
                CardElementView(element: element)
                    .elementContextMenu(
                        card: $card,
                        element: $element)
                    .resizableView(transform: $element.transform)
                    .frame(
                        width: element.transform.size.width,
                        height: element.transform.size.height)
            }
        }
        .dropDestination(for: CustomTransfer.self) { items, location in
            print(location)
            Task {
                await MainActor.run {
                    card.addElements(from: items)
                }
            }
            return !items.isEmpty
        }
    }
}

struct CardDetailView_Previews: PreviewProvider {
    struct CardDetailPreview: View {
        @EnvironmentObject var store: CardStore
        var body: some View {
            CardDetailView(card: $store.cards[0])
        }
    }

    static var previews: some View {
        CardDetailPreview()
            .environmentObject(CardStore(defaultData: true))
    }
}
