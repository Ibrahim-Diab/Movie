//
//  AppEmptyView.swift
//  MovieApp
//
//  Created by Diab on 24/09/2025.
//

import SwiftUI

struct AppEmptyView:View {
    
    let message:String?
    let describtion:String?
    
    var body: some View {
        VStack(spacing: 16){
            
            Image("empty_icon")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
            
            Text(message ?? "No Data Available Fro Now")
                .textStyle(font: .headline, color: Theme.colors.primary)
            
            if let describtion = describtion{
                Text(describtion)
                    .textStyle(font: .title, color: Theme.colors.grayText)
                
            }
            
        }
    }
}

