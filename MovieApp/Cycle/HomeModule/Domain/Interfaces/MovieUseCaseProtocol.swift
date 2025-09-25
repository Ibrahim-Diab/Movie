//
//  MovieUseCaseProtocol.swift
//  MovieApp
//
//  Created by Diab on 25/09/2025.
//

import Combine

@MainActor
protocol MovieUseCaseProtocol{
    func getNowPlayingMovieData(page: Int) -> AnyPublisher<MovieListAPIResponse,NetworkError>
    func getPopularMovieData(page: Int) -> AnyPublisher<MovieListAPIResponse,NetworkError>
    func getUpcomingMovieData(page: Int) -> AnyPublisher<MovieListAPIResponse,NetworkError>
    func createMovieListType() -> [SegmentButtonModel]
    func updateType(withId id: Int, in list: [SegmentButtonModel]) -> [SegmentButtonModel]
}
