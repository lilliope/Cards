//  BottomToolbar.swift
//  Cards
//  Created by Loi Ton on 2/11/26.

import SwiftUI

struct ToolbarButton: View {
    let modal: ToolbarSelection
    private let modalButton: [
        ToolbarSelection: (text: String, imageName: String)
    ] = [
        .photoModal: ("Photos", "photo"),
        .frameModal: ("Frames", "square.on.circle"),
        .stickerModal: ("Stickers", "heart.circle"),
        .textModal: ("Text", "textformat")
    ]
    
    var body: some View {
        if let text = modalButton[modal]?.text,
           let imageName = modalButton[modal]?.imageName {
            VStack {
                Image(systemName: imageName)
                    .font(.largeTitle)
                Text(text)
            }
            .padding(.top)
            }
    }
}

struct BottomToolbar: View {
    @Binding var modal: ToolbarSelection?
    
    var body: some View {
        HStack {
            ForEach(ToolbarSelection.allCases) { selection in
                Button {
                    modal = selection
                }
                label: {
                    ToolbarButton(modal: selection)
                }
            }
        }
    }
}

struct BottomToolbar_Previews: PreviewProvider {
    static var previews: some View {
        BottomToolbar(modal: .constant(.stickerModal))
    }
}
