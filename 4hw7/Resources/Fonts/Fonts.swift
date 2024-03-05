//
//  Fonts.swift
//  4hw7
//
//  Created by Telegey Nurbekova on 02/03/24.
//

import UIKit

enum Fonts: String {
    case semiBold = "Poppins-SemiBold"
    case regular = "Poppins-Regular"
    case extraLight = "Poppins-ExtraLight"
    
    func size(_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: rawValue, size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size)
        }
    }
}
