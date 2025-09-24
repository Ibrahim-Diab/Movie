//
//  AppMessageView.swift
//  MovieApp
//
//  Created by Diab on 24/09/2025.
//

import SwiftUI

struct AppMessageView: View {
    @State var show = false
    @State var selectedAlert: AlertType
    
    var body: some View {
        CustomAlertView(
            icon: selectedAlert.icon,
            iconColor: selectedAlert.iconColor,
            message: selectedAlert.message,
            backgroundColor: selectedAlert.bacgroundColor,
            lineColor: selectedAlert.lineColor
        )
            .shadow(radius: 0.5)
            .onAppear {
                showAlert(type: selectedAlert)
            }
    }
    func showAlert(type: AlertType) {
        selectedAlert = type
        withAnimation(.spring) {
            show = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            withAnimation(.spring) {
                show = false
            }
        }
    }
}
