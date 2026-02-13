//  Card.swift
//  Cards
//  Created by Loi Ton on 2/12/26.

import SwiftUI

struct Card: Identifiable {
    let id = UUID()
    var backgroundColor: Color = .yellow
    var elements: [CardElement] = []
}
