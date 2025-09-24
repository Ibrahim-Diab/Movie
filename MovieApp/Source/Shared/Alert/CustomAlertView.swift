//
//  AppAlert.swift
//  MovieApp
//
//  Created by Diab on 24/09/2025.
//


import SwiftUI

struct CustomAlertView: View {
    @State var show = false
    var icon: String
    var iconColor: Color
    var message: String
    var backgroundColor:Color
    var lineColor:Color
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 10) {
                ZStack {
                    Circle()
                        .frame(width: 40, height: 40)
                        .foregroundColor(iconColor.opacity(0.2))
                    Image(icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(iconColor)
                }

                Text(message)
                    .font(.system(size: 12,weight: .semibold))
                    .foregroundStyle(lineColor)
                    .multilineTextAlignment(.leading)
            }
            .padding(10)
           
            .background(
                Capsule()
                    .fill(backgroundColor)
                    .shadow(color: Color(UIColor.label).opacity(0.2), radius: 2, x: 0.5, y: 0.5)
            )
            Spacer()
        }
        .padding(10)
    }
}




