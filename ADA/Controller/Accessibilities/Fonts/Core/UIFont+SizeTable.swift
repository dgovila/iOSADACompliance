//
//  UIFont+SizeTable.swift
//  ADA
//
//  Created by Majumdar, Amit on 08/07/21.
//

import UIKit

//MARK: - Size Table
extension UIFont {
    
    /// Returns a preferred size corresponding to a textStyle
    /// - Parameter textStyle: textStyle
    /// - Returns: size
    static func preferredSize(forTextStyle textStyle: UIFont.TextStyle) -> CGFloat {
        let category = UIApplication.shared.preferredContentSizeCategory
        
        #if DEBUG
        guard let size = sizeTable[textStyle]?[category] else {
            fatalError("Font size not specified for style \"\(textStyle)\" and category \"\(category)\"")
        }
        return size
        #else
        // If the provided style isn't in the table, just use .body
        let categoryDict = sizeTable[textStyle] ?? sizeTable[.body]!
        // If the provided category isn't in the table, just use .large
        let size = categoryDict[category] ?? categoryDict[.large]!
        return size
        #endif
    }
    
    /// `sizeTable` modify this variable as par the design guidelines
    @nonobjc private static let sizeTable: [UIFont.TextStyle : [UIContentSizeCategory : CGFloat]] =
        [
            .largeTitle: [
                .accessibilityExtraExtraExtraLarge: 42,
                .accessibilityExtraExtraLarge: 41,
                .accessibilityExtraLarge: 40,
                .accessibilityLarge: 39,
                .accessibilityMedium: 38,
                .extraExtraExtraLarge: 37,
                .extraExtraLarge: 36,
                .extraLarge: 35,
                .large: 34,
                .medium: 33,
                .small: 32,
                .extraSmall: 31
            ],
            .title1: [
                .accessibilityExtraExtraExtraLarge: 36,
                .accessibilityExtraExtraLarge: 35,
                .accessibilityExtraLarge: 34,
                .accessibilityLarge: 33,
                .accessibilityMedium: 32,
                .extraExtraExtraLarge: 31,
                .extraExtraLarge: 30,
                .extraLarge: 29,
                .large: 28,
                .medium: 27,
                .small: 26,
                .extraSmall: 25
            ],
            .title2: [
                .accessibilityExtraExtraExtraLarge: 32,
                .accessibilityExtraExtraLarge: 31,
                .accessibilityExtraLarge: 30,
                .accessibilityLarge: 29,
                .accessibilityMedium: 28,
                .extraExtraExtraLarge: 27,
                .extraExtraLarge: 26,
                .extraLarge: 25,
                .large: 24,
                .medium: 23,
                .small: 22,
                .extraSmall: 21
            ],
            .title3: [
                .accessibilityExtraExtraExtraLarge: 28,
                .accessibilityExtraExtraLarge: 27,
                .accessibilityExtraLarge: 26,
                .accessibilityLarge: 25,
                .accessibilityMedium: 24,
                .extraExtraExtraLarge: 23,
                .extraExtraLarge: 22,
                .extraLarge: 21,
                .large: 20,
                .medium: 19,
                .small: 18,
                .extraSmall: 17
            ],
            .headline: [
                .accessibilityExtraExtraExtraLarge: 21,
                .accessibilityExtraExtraLarge: 21,
                .accessibilityExtraLarge: 21,
                .accessibilityLarge: 21,
                .accessibilityMedium: 21,
                .extraExtraExtraLarge: 20,
                .extraExtraLarge: 19,
                .extraLarge: 18,
                .large: 17,
                .medium: 16,
                .small: 15,
                .extraSmall: 14
            ],
            .subheadline: [
                .accessibilityExtraExtraExtraLarge: 18,
                .accessibilityExtraExtraLarge: 18,
                .accessibilityExtraLarge: 18,
                .accessibilityLarge: 18,
                .accessibilityMedium: 18,
                .extraExtraExtraLarge: 18,
                .extraExtraLarge: 17,
                .extraLarge: 16,
                .large: 15,
                .medium: 14,
                .small: 13,
                .extraSmall: 12
            ],
            .body: [
                .accessibilityExtraExtraExtraLarge: 53,
                .accessibilityExtraExtraLarge: 47,
                .accessibilityExtraLarge: 40,
                .accessibilityLarge: 33,
                .accessibilityMedium: 28,
                .extraExtraExtraLarge: 23,
                .extraExtraLarge: 21,
                .extraLarge: 19,
                .large: 17,
                .medium: 16,
                .small: 15,
                .extraSmall: 14
            ],
            .callout: [
                .accessibilityExtraExtraExtraLarge: 24,
                .accessibilityExtraExtraLarge: 23,
                .accessibilityExtraLarge: 22,
                .accessibilityLarge: 21,
                .accessibilityMedium: 20,
                .extraExtraExtraLarge: 19,
                .extraExtraLarge: 18,
                .extraLarge: 17,
                .large: 16,
                .medium: 15,
                .small: 14,
                .extraSmall: 13
            ],
            .footnote: [
                .accessibilityExtraExtraExtraLarge: 17,
                .accessibilityExtraExtraLarge: 17,
                .accessibilityExtraLarge: 17,
                .accessibilityLarge: 17,
                .accessibilityMedium: 17,
                .extraExtraExtraLarge: 16,
                .extraExtraLarge: 15,
                .extraLarge: 14,
                .large: 13,
                .medium: 12,
                .small: 12,
                .extraSmall: 12
            ],
            .caption1: [
                .accessibilityExtraExtraExtraLarge: 14,
                .accessibilityExtraExtraLarge: 14,
                .accessibilityExtraLarge: 14,
                .accessibilityLarge: 14,
                .accessibilityMedium: 14,
                .extraExtraExtraLarge: 13,
                .extraExtraLarge: 13,
                .extraLarge: 13,
                .large: 12,
                .medium: 11,
                .small: 11,
                .extraSmall: 11
            ],
            .caption2: [
                .accessibilityExtraExtraExtraLarge: 13,
                .accessibilityExtraExtraLarge: 13,
                .accessibilityExtraLarge: 13,
                .accessibilityLarge: 13,
                .accessibilityMedium: 13,
                .extraExtraExtraLarge: 13,
                .extraExtraLarge: 12,
                .extraLarge: 12,
                .large: 11,
                .medium: 11,
                .small: 11,
                .extraSmall: 11
            ]
        ]
}


