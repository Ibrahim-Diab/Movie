//
//  HeaderView.swift
//  MovieApp
//
//  Created by Diab on 25/09/2025.
//

import SwiftUI

struct HeaderView: View {
    
    var headingImage:String = ""
    var headingText:String = ""
    
    var body: some View {
        
        HStack{
            Image(systemName: headingImage)
                .foregroundColor(Theme.colors.primary)
                .imageScale(.large)
            Text(headingText)
                .textStyle(font: .system(size: 14,weight: .heavy), color: .white)
        }
    }
    
} 
