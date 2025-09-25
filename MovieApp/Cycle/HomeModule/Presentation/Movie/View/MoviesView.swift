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
                                       
                }
                
                if viewModel.isHorizontal {
                    // Horizontal Scroll
                    buildHorziontalView
                } else {
                    // Vertical Scroll
                    buildVerticallView
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
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        viewModel.isHorizontal.toggle()
                    }) {
                        Image(systemName: viewModel.isHorizontal ? SFSymbol.rectangleHorizontal.rawValue : SFSymbol.rectangleVertical.rawValue )
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(Theme.colors.secondry)
                    }
                }
            }
        }
    }
    
    var buildHorziontalView: some View{
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 20) {
                ForEach(viewModel.movies, id: \.movieId) { item in
                    MovieCardView(movie: item,height: UIScreen.main.bounds.height/2)
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
    
    var buildVerticallView: some View{
        ScrollView( showsIndicators: false) {
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


