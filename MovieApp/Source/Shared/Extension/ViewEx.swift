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

//MARK: - Continer -

struct ContainerCardBackgroundModifier<S: ShapeStyle>: ViewModifier {
    var cornerRadius: CGFloat
    var style: S
    
    func body(content: Content) -> some View {
        content
            .background(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(style)
            )
    }
}



extension View {
    func textStyle(font: Font, color: Color) -> some View {
        self.modifier(CustomTextStyleModifier(font: font, color: color))
    }
    
    func containerCardBackground<S: ShapeStyle>(
        cornerRadius: CGFloat = AppConstants.Layout.cornerRadiusMedium,
        style: S = Color.gray
    ) -> some View {
        self.modifier(ContainerCardBackgroundModifier(cornerRadius: cornerRadius, style: style))
    }
    
}
