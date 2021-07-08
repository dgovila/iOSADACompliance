//
//  OpenSans.swift
//  ADA
//
//  Created by Majumdar, Amit on 08/07/21.
//

import UIKit

//MARK: - Fonts

enum OpenSans: String, FontType {
    case bold = "OpenSans-Bold"
    case boldItalic = "OpenSans-BoldItalic"
    case extraBold = "OpenSans-Extrabold"
    case extraBoldItalic = "OpenSans-ExtraboldItalic"
    case italic = "OpenSans-Italic"
    case light = "OpenSans-Light"
    case lightItalic = "OpenSansLight-Italic"
    case regular = "OpenSans"
    case semibold = "OpenSans-Semibold"
    case semiboldItalic = "OpenSans-SemiboldItalic"
}

enum SystemFont: FontType {
   
    case ultraLight, thin, light, regular, medium, semibold, bold, heavy, black, italic
    
    private var weight: UIFont.Weight {
        switch self {
        case .ultraLight: return .ultraLight
        case .thin: return .thin
        case .light: return .light
        case .regular: return .regular
        case .medium: return .medium
        case .semibold: return .semibold
        case .bold: return .bold
        case .heavy: return .heavy
        case .black: return .black
        case .italic: return .regular
        }
    }
    
    func of(size: CGFloat) -> UIFont {
        switch self {
        case .italic:
            return .italicSystemFont(ofSize: size)
        default:
            return .systemFont(ofSize: size, weight: weight)
        }
    }
    
    func of(textStyle: UIFont.TextStyle) -> UIFont {
        let size = UIFont.preferredSize(forTextStyle: textStyle)
        switch self {
        case .italic:
            return .italicSystemFont(ofSize: size)
        default:
            return .systemFont(ofSize: size, weight: weight)
        }
    }
    
    func of(size: CGFloat, textStyle: UIFont.TextStyle, usesDynamicFont: Bool) -> UIFont {
        usesDynamicFont ? of(textStyle: textStyle) : of(size: size)
    }
}
