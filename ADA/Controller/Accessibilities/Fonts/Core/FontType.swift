//
//  FontType.swift
//  ADA
//
//  Created by Majumdar, Amit on 08/07/21.
//

import UIKit

/// `FontType` confirm to this protocol to apply fonts
protocol FontType {
    
    /// Apply Font for a particular point size
    /// - Parameter size: size
    func of(size: CGFloat) -> UIFont
    
    /// Apply Font for a particular textStyle
    /// - Parameter textStyle: TextStyle
    func of(textStyle: UIFont.TextStyle) -> UIFont
    
    /// Apply Font for a particular point size or textStyle based on usesDynamicFont flag
    /// - Parameters:
    ///   - size: size
    ///   - textStyle: textStyle
    ///   - usesDynamicFont: usesDynamicFont flag
    func of(size: CGFloat, textStyle: UIFont.TextStyle, usesDynamicFont: Bool) -> UIFont
}

// MARK: - FontType Extension Protocol Implementation
extension FontType where Self: RawRepresentable, Self.RawValue == String {
    func of(size: CGFloat) -> UIFont {
        guard let font = UIFont(name: rawValue, size: size) else {
            #if DEBUG
                fatalError("Font \"\(rawValue)\" not found.")
            #else
                return .systemFont(ofSize: size)
            #endif
        }
        return font
    }
    
    func of(textStyle: UIFont.TextStyle) -> UIFont {
        let size = UIFont.preferredSize(forTextStyle: textStyle)
        guard let font = UIFont(name: rawValue, size: size) else {
            #if DEBUG
                fatalError("Font \"\(rawValue)\" not found.")
            #else
                return .systemFont(ofSize: size)
            #endif
        }
        return font
    }
    
    func of(size: CGFloat, textStyle: UIFont.TextStyle, usesDynamicFont: Bool) -> UIFont {
        usesDynamicFont ? of(textStyle: textStyle) : of(size: size)
    }
}
