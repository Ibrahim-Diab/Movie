//
//  File.swift
//  MovieApp
//
//  Created by Diab on 24/09/2025.
//

    
import SwiftUI

struct LoaderView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .opacity(0.6)
                .ignoresSafeArea()
            
            VStack {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle(tint: Theme.colors.primary))
                    .scaleEffect(1.5)
                    .padding()
                    .textStyle(font: .largeTitle, color: Theme.colors.primary)
            }
        }
    }
}

