//
//  MovieCardView.swift
//  MovieApp
//
//  Created by Diab on 24/09/2025.
//

import SwiftUI


struct MovieCardView: View {
    
    var movie: MovieCardViewDataSource
    weak var delegate: MovieCardViewDelegate?
    
    var body: some View {
          RemoteImageView(remoteURL: movie.moviePosterImage)
            .frame(height: 170)
            .background(Theme.colors.darkWhite)
            .cornerRadius(30)
            .clipped()
            .overlay(alignment: .bottom) {
                HStack{
                    VStack(alignment:.leading,spacing: 4){
                        Text(movie.movieTitle)
                            .textStyle(font: .system(size: 14,weight: .bold), color: .white)
                        Text(movie.movieReleaseDate)
                            .textStyle(font: .system(size: 12,weight: .semibold), color: .gray)
                    }
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Theme.colors.primary.opacity(0.50))
                .cornerRadius(30)
                .shadow(radius: 10)
            }
        
    }
}
