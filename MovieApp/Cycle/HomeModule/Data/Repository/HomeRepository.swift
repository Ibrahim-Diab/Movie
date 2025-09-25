//
//  HomeRepository.swift
//  MovieApp
//
//  Created by Diab on 25/09/2025.
//

import Combine

@MainActor
protocol HomeRepositoryProtocol {
    func getNowPlayingMovieData(page: Int) -> AnyPublisher<MovieListAPIResponse,NetworkError>
    func getPopularMovieData(page: Int) -> AnyPublisher<MovieListAPIResponse,NetworkError>
    func getUpcomingMovieData(page: Int) -> AnyPublisher<MovieListAPIResponse,NetworkError>
    func createMovieListType() -> [SegmentButtonModel]
    func getMovieDetailsData(id: Int) -> AnyPublisher<MovieDetailsAPIResponce,NetworkError>
    
}

final class HomeRepository: HomeRepositoryProtocol {
        
    private let networkService: NetworkServiceProtocol

    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getNowPlayingMovieData(page: Int) -> AnyPublisher<MovieListAPIResponse, NetworkError> {
        let endPoint = HomeEndPoint.getNowPlayingMovieDataAPIComponent(page: page)
        return networkService.request(endPoint, progress: nil)
    }
    
    func getPopularMovieData(page: Int) -> AnyPublisher<MovieListAPIResponse, NetworkError> {
        let endPoint = HomeEndPoint.getPopularMovieDataAPIComponent(page: page)
        return networkService.request(endPoint, progress: nil)
    }
    
    func getUpcomingMovieData(page: Int) -> AnyPublisher<MovieListAPIResponse, NetworkError> {
        let endPoint = HomeEndPoint.getUpcomingMovieDataAPIComponent(page: page)
        return networkService.request(endPoint, progress: nil)
    }
    
    func getMovieDetailsData(id: Int) -> AnyPublisher<MovieDetailsAPIResponce, NetworkError> {
        let endPoint = HomeEndPoint.getMovieDetailsAPIComponent(id: id)
        return networkService.request(endPoint, progress: nil)
    }
    
    func createMovieListType() -> [SegmentButtonModel] {
        return[.init(id: MovieListTypes.nowPlaying.rawValue, name: "nowPlaying", isSelected: true, icon: "live_icon"),
               .init(id: MovieListTypes.popular.rawValue, name: "popular", icon: "popular_icon"),
               .init(id: MovieListTypes.upcoming.rawValue, name: "upcoming", icon: "upcoming_icon")]
    }
    

}
