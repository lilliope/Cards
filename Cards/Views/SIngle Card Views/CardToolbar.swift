//  CardToolbar.swift
//  Cards
//  Created by Loi Ton on 2/12/26.

import SwiftUI

struct CardToolbar: ViewModifier {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var store: CardStore
    @Binding var currentModal: ToolbarSelection?
    @Binding var card: Card
    @State private var stickerImage: UIImage?
    @State private var frameIndex: Int?
    @State private var textElement = TextElement()
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    menu
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .bottomBar) {
                    BottomToolbar(
                        card: $card,
                        modal: $currentModal)
                }
            }
            .sheet(item: $currentModal) { item in
                switch item {
                case .stickerModal:
                    StickerModal(stickerImage: $stickerImage)
                        .onDisappear {
                            if let stickerImage = stickerImage {
                                card.addElement(uiImage: stickerImage)
                            }
                            stickerImage = nil
                        }
                case .frameModal:
                    FrameModal(frameIndex: $frameIndex)
                        .onDisappear {
                            if let frameIndex {
                                card.update(
                                    store.selectedElement,
                                    frameIndex: frameIndex)
                            }
                            frameIndex = nil
                        }
                case .textModal:
                    TextModal(textElement: $textElement)
                        .onDisappear {
                            if !textElement.text.isEmpty {
                                card.addElement(text: textElement)
                            }
                            textElement = TextElement()
                        }
                default:
                    Text(String(describing: item))
                }
            }
    }
    
    var menu: some View {
        Menu {
            Button {
                if UIPasteboard.general.hasImages {
                    if let images = UIPasteboard.general.images {
                        for image in images {
                            card.addElement(uiImage: image)
                        }
                    }
                }
                else if UIPasteboard.general.hasStrings {
                    if let strings = UIPasteboard.general.strings {
                        for text in strings {
                            card.addElement(text: TextElement(text: text))
                        }
                    }
                }
            }
            label: {
                Label("Paste", systemImage: "doc.on.clipboard")
            }
            .disabled(!UIPasteboard.general.hasImages && !UIPasteboard.general.hasStrings)
            }
            label: {
                Label("Add", systemImage: "ellipsis.circle")
            }
    }
}

struct CardToolbar_Previews: PreviewProvider {
    static var previews: some View {
        Color.yellow
            .modifier(CardToolbar(
                currentModal: .constant(nil),
                card: .constant(Card())))
            .environmentObject(CardStore(defaultData: true))
    }
}
