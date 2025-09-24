//
//  ViewEx.swift
//  MovieApp
//
//  Created by Diab on 24/09/2025.
//

import SwiftUI


 //MARK: - Text Style -
struct CustomTextStyleModifier: ViewModifier {
    let font: Font
    let color: Color

    func body(content: Content) -> some View {
        content
            .foregroundColor(color)
            .font(font)
    }
}


extension View {
    func textStyle(font: Font, color: Color) -> some View {
        self.modifier(CustomTextStyleModifier(font: font, color: color))
    }
    
}
