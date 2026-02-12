//  CardThumbnail.swift
//  Cards
//  Created by Loi Ton on 2/11/26.

import SwiftUI

struct CardThumbnail: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .foregroundStyle(.gray)
            .frame(width: 150, height: 250)
    }
}

struct CardThumbnail_Previews: PreviewProvider {
    static var previews: some View {
        CardThumbnail()
    }
}
