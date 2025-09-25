//
//  MoviesView.swift
//  MovieApp
//
//  Created by Diab on 25/09/2025.
//

import SwiftUI

struct MoviesView: View {
    
    @StateObject var viewModel: MoviesViewModel
    @EnvironmentObject var coordinator: HomeCoordinator
    
    init(viewModel: MoviesViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        BaseView(state: viewModel.viewState) {
            
            VStack(alignment: .leading, spacing: AppConstants.Layout.cornerRadiusMedium) {
                // Segment Tabs
                HStack(spacing: AppConstants.Layout.spacingSmall) {
                    ForEach(viewModel.movieListTypes, id: \.id) { item in
                        SegmenButtonView(item: item, delegate: viewModel)
                    }
                }.padding(.horizontal)
                
                ScrollView(showsIndicators: false) {
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.movies, id: \.movieId) { item in
                            MovieCardView(movie: item)
                                .onAppear {
                                    viewModel.loadMoreMoviesIfNeeded(currentItem: item)
                                }
                                .onTapGesture {
                                    viewModel.routeToDetail(movieId: item.movieId)
                                }
                        }
                    }
                    .padding(.horizontal)
                    
                }
            }
        }
        .onReceive(viewModel.navigationEvent) { route in
            coordinator.navigate(to: route)
        }
        .task {
            viewModel.didLoad()
        }
        .navigationTitle("Movies")
        .navigationBarTitleDisplayMode(.inline)
    }
}

