//
//  RootView.swift
//  MovieApp
//
//  Created by Diab on 24/09/2025.
//



import SwiftUI

struct RootView: View {
    
    private let apiDataTransferService: NetworkExecutor = DefaultNetworkExecutor()
   
    private var homeFactory: HomeViewModelFactory {
        HomeViewModelFactory(
            dependencies: .init(apiDataTransferService: apiDataTransferService)
        )
    }
    
    
    var body: some View {
        HomeNavView(factory: homeFactory)
    }
}
