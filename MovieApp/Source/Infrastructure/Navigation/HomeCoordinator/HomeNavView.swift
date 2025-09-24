//
//  HomeNavView.swift
//  MovieApp
//
//  Created by Diab on 24/09/2025.
//


import SwiftUI

struct HomeNavView: View {
    
    @StateObject var coordinator = HomeCoordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {
            HomeView()
                .navigationDestination(for: HomeRoute.self) { route in
                    switch route {
                    case .movieDetails:
                        EmptyView()
                    }
                    
                }
        }
    }

  
}

