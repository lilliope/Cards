//  PhotosModal.swift
//  Cards
//  Created by Loi Ton on 2/20/26.

import SwiftUI
import PhotosUI

struct PhotosModal: View {
    @Binding var card: Card
    @State private var selectedItems: [PhotosPickerItem] = []
    
    var body: some View {
        PhotosPicker(
            selection: $selectedItems,
            matching: .images) {
                ToolbarButton(modal: .photoModal)
            }
            .onChange(of: selectedItems) { items in
                for item in items {
                    item.loadTransferable(type: Data.self) { result in
                        Task {
                            switch result {
                            case .success(let data):
                                if let data,
                                   let uiImage = UIImage(data: data) {
                                    await MainActor.run {
                                        card.addElement(uiImage: uiImage)
                                    }
                                }
                            case .failure(let failure):
                                fatalError("Image transfer failed: \(failure)")
                            }
                        }
                    }
                }
                selectedItems = []
            }
    }
}

struct PhotosModal_Previews: PreviewProvider {
    static var previews: some View {
        PhotosModal(card: .constant(Card()))
    }
}
