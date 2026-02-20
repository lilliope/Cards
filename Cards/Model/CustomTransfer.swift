//  CustomTransfer.swift
//  Cards
//  Created by Loi Ton on 2/20/26.

import SwiftUI

struct CustomTransfer: Transferable {
    var image: UIImage?
    var text: String?
    
    public static var transferRepresentation:
        some TransferRepresentation {
            DataRepresentation(importedContentType: .image) { data in
                let image = UIImage(data:data) ?? UIImage(named: "error-image")
                return CustomTransfer(image: image)
            }
            DataRepresentation(importedContentType: .text) { data in
                let docType = NSAttributedString.DocumentType.html
                let encoding = String.Encoding.utf8.rawValue
                guard let text = try? NSAttributedString(
                    data: data,
                    options: [
                        .documentType: docType,
                        .characterEncoding: encoding
                    ],
                    documentAttributes: nil)
                else {
                    return CustomTransfer(text: nil)
                }
                return CustomTransfer(text: text.string)
            }
        }
}
