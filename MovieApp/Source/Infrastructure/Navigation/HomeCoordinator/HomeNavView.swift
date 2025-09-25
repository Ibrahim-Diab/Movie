//
//  HomeNavView.swift
//  MovieApp
//
//  Created by Diab on 24/09/2025.
//


import SwiftUI

struct HomeNavView: View {
    
    @StateObject var coordinator = HomeCoordinator()
    let factory: HomeViewModelFactoryProtocol


    var body: some View {
        NavigationStack(path: $coordinator.path) {
            MoviesView(viewModel: factory.buildMoviesViewModel())
                .environmentObject(coordinator)
                .navigationDestination(for: HomeRoute.self) { route in
                    switch route {
                    case let .movieDetails(id):
                        MovieDetailsView(viewModel: factory.buildMovieDetailsViewModel(id: id))
                    }
                    
                }
        }
    }

  
}

