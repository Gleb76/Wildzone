//
//  File.swift
//  
//
//  Created by Назар Ткаченко on 10.08.2024.
//

import SwiftUI

public enum Typography {
    case heading1
    case heading2
    
    case subHeading1
    case subHeading2
    
    case bodyText1
    case bodyText2
    
    case metaData1
    case metaData2
    case metaData3
}

public struct TextFontStyles: ViewModifier {
    var typography: Typography
    
    public func body(content: Content) -> some View {
        switch typography {
        case .heading1:
            return content
                .font(.system(size: 32, weight: .bold))
        case .heading2:
            return content
                .font(.system(size: 24, weight: .bold))
            
        case .subHeading1:
            return content
                .font(.system(size: 18, weight: .semibold))
        case .subHeading2:
            return content
                .font(.system(size: 16, weight: .semibold))
            
        case .bodyText1:
            return content
                .font(.system(size: 14, weight: .semibold))
        case .bodyText2:
            return content
                .font(.system(size: 14, weight: .regular))
            
        case .metaData1:
            return content
                .font(.system(size: 12, weight: .regular))
        case .metaData2:
            return content
                .font(.system(size: 10, weight: .regular))
        case .metaData3:
            return content
                .font(.system(size: 10, weight: .semibold))
        }
    }
}

public extension View {
    func textStyle(with typography: Typography ) -> some View {
        modifier(TextFontStyles(typography: typography))
    }
}
