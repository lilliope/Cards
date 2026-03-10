//  Settings.swift
//  Cards
//  Created by Loi Ton on 2/11/26.

import SwiftUI

enum Settings {
    static let cardSize = CGSize(width: 1300, height: 2000)
    static let thumbnailSize = CGSize(width: 150, height: 250)
    static let defaultElementSize = CGSize(width: 800, height: 800)
    static let borderColor: Color = .blue
    static let borderWidth: CGFloat = 5
    
    static func calculateSize(_ size: CGSize) -> CGSize {
        var newSize = size
        let ratio = Settings.cardSize.width / Settings.cardSize.height
        
        if size.width < size.height {
            newSize.height = min(size.height, newSize.width / ratio)
            newSize.width = min(size.width, newSize.height * ratio)
        }
        else {
            newSize.width = min(size.width, newSize.height * ratio)
            newSize.height = min(size.height, newSize.width / ratio)
        }
        return newSize
    }
    
    static func calculateScale(_ size: CGSize) -> CGFloat {
        let newSize = calculateSize(size)
        return newSize.width / Settings.cardSize.width
    }
}

extension Settings {
    static func calculateDropOffset(
        proxy: GeometryProxy?,
        location: CGPoint
    ) -> CGSize {
        guard
            let proxy,
            proxy.size.width > 0 && proxy.size.height > 0
        else { return .zero }
        let frame = proxy.frame(in: .global)
        let size = proxy.size
        let leftMargin = (frame.width - size.width) * 0.5 + frame.origin.x
        let topMargin = (frame.height - size.height) * 0.5 + frame.origin.y
        var cardLocation = CGPoint(x: location.x - leftMargin, y: location.y - topMargin)
        cardLocation.x = cardLocation.x / size.width * Settings.cardSize.width
        cardLocation.y = cardLocation.y / size.height * Settings.cardSize.height
        let offset = CGSize(
            width: cardLocation.x - Settings.cardSize.width * 0.5,
            height: cardLocation.y - Settings.cardSize.height * 0.5)
        return offset
    }
}
