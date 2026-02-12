//  ToolbarSelection.swift
//  Cards
//  Created by Loi Ton on 2/11/26.

import Foundation

enum ToolbarSelection: CaseIterable, Identifiable {
    var id: Int {
        hashValue
    }
    case photoModal, frameModal, stickerModal, textModal
}
