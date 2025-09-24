//
//  BaseVC.swift
//  MovieApp
//
//  Created by Diab on 24/09/2025.
//

import SwiftUI

struct BaseView<Content: View>: View {
    let color: Color
    let state: ViewState
    let retryAction: (() -> Void)?
    let content: () -> Content

    @State private var showToast: Bool = false
    @State private var currentAlert: AlertType? = nil
    
    init(
        color: Color = Theme.colors.mainBackGround,
        state: ViewState,
        retryAction: (() -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.color = color
        self.state = state
        self.retryAction = retryAction
        self.content = content
    }
    
    var body: some View {
        ZStack {
            color.edgesIgnoringSafeArea(.all)
            
            switch state {
            case let .empty(message,describtion):
                AppEmptyView(message: message, describtion: describtion)
            case .content,
                    .error,
                    .showSuccessAlert,.loading:
                content()
                    .opacity(shouldDisableContent ? 0.5 : 1)
                    .disabled(shouldDisableContent)
            }
            
            if case  .loading = state {
                LoaderView()
            }
            
            if case let .error(message) = state {
                createShowAppMessageView(type: .error(message: message))
            }
            
            if case let .showSuccessAlert(message) = state {
                createShowAppMessageView(type: .success(message: message))
                
            }
            
        }
        
    }
    
    private func createShowAppMessageView(type:AlertType) -> some View{
            switch type{
            case let .error(message):
                AppMessageView(selectedAlert: .error(message: message))
            case let .success(message):
                AppMessageView(selectedAlert: .success(message: message))
            }
        }

    private var shouldDisableContent: Bool {
        state == .loading
    }
}



