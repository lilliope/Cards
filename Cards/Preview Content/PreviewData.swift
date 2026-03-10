//  PreviewData.swift
//  Cards
//  Created by Loi Ton on 2/12/26.

import SwiftUI

let initialCards: [Card] = [
    Card(backgroundColor: Color("random1"), elements: initialElements),
    Card(backgroundColor: Color("random2")),
    Card(backgroundColor: Color("random3")),
    Card(backgroundColor: Color("random4")),
    Card(backgroundColor: Color("random8"))
]

let initialElements: [CardElement] = [
    ImageElement(
        transform: Transform(
            size: Settings.defaultElementSize * 0.9,
            rotation: .init(degrees: -6),
            offset: CGSize(width: 4, height: -137)),
        uiImage: UIImage(named: "giraffe1")),
    TextElement(
        transform: Transform(
            size: CGSize(width: 600, height: 300),
            offset: CGSize(width: 12, height: 400)),
        text: "Snack time!",
        textColor: .blue)
]
