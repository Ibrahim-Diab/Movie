//
//  MovieDetailsUseCaseProtocol.swift
//  MovieApp
//
//  Created by Diab on 25/09/2025.
//

import Combine

@MainActor
protocol MovieDetailsUseCaseProtocol{
    func getMovieDetailsData(id: Int) -> AnyPublisher<MovieDetailsAPIResponce,NetworkError>
}
