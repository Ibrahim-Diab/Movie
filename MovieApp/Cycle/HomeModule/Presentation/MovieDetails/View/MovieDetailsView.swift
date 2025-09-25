//
//  MoviesView.swift
//  MovieApp
//
//  Created by Diab on 25/09/2025.
//

import SwiftUI

struct MovieDetailsView: View {
    
    @StateObject var viewModel: MovieDetailsViewModel
    @EnvironmentObject var coordinator: HomeCoordinator
    
    init(viewModel: MovieDetailsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        
        ScrollView(showsIndicators: false){
            
            VStack(alignment:.leading,spacing:15){
                
                RemoteImageView(
                    remoteURL: viewModel.movieData?.moviePosterImage ?? "")
                    .frame(height: UIScreen.main.bounds.height/3)
                    .clipped()
                
                VStack(alignment: .leading,spacing:AppConstants.Layout.spacingMedium){
                    Text(viewModel.movieData?.movieTitle ?? "")
                        .textStyle(font: .system(size: 16,weight: .heavy), color: Theme.colors.secondry)
                    
                    Text("RunTime :: " + (viewModel.movieData?.movieRunTime ?? ""))
                        .textStyle(font: .system(size: 12,weight: .bold), color: Theme.colors.secondry)
                        .foregroundStyle(Theme.colors.primary.opacity(0.80))
                }
                
                VStack(alignment: .leading,spacing:AppConstants.Layout.spacingSmall){
                    HeaderView(
                        headingImage: "info.circle.fill",
                        headingText: "info about \(viewModel.movieData?.movieTitle ?? "")"
                    )
                    Text(viewModel.movieData?.movieOverview ?? "" )
                        .multilineTextAlignment(.leading)
                }
                
                Text(viewModel.movieData?.movieGenereText ?? "")
                    .textStyle(font: .system(size: 14,weight: .bold), color: Theme.colors.secondry)
                    .foregroundStyle(Theme.colors.primary.opacity(0.80))
                 
            }.padding(.horizontal,AppConstants.Layout.defaultPadding)
            
            
            .task {
                viewModel.didLoad()
            }
            
            .navigationTitle(" \(viewModel.movieData?.movieTitle ?? "")")
            .navigationBarTitleDisplayMode(.large)
        }
        
        
        
    }
}


