//  Operators.swift
//  Cards
//  Created by Loi Ton on 2/11/26.

import SwiftUI

func + (left: CGSize, right: CGSize) -> CGSize {
    CGSize(
        width: left.width + right.width,
        height: left.height + right.height)
}
