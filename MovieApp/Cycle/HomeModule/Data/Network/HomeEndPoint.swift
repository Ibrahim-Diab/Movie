//
//  HomeEndPoint.swift
//  MovieApp
//
//  Created by Diab on 25/09/2025.
//



import Foundation

@MainActor
struct HomeEndPoint {
    private init() {}
}

extension HomeEndPoint {
    
    
    static func getNowPlayingMovieDataAPIComponent(page: Int) -> ConfigEndpoint<MovieListAPIResponse> {
        return .init(
            path: "3/movie/now_playing",
            method: .get,
            parameters: [
                "page": page
            ]
        )
    }

    static func getPopularMovieDataAPIComponent(page: Int) -> ConfigEndpoint<MovieListAPIResponse> {
        return .init(
            path: "3/movie/popular",
            method: .get,
            parameters: [
                "page": page
            ]
        )
    }
    
    static func getUpcomingMovieDataAPIComponent(page: Int) -> ConfigEndpoint<MovieListAPIResponse> {
        return .init(
            path: "3/movie/upcoming",
            method: .get,
            parameters: [
                "page": page
            ]
        )
    }
    
    
    static func getMovieDetailsAPIComponent(id:Int) -> ConfigEndpoint<MovieDetailsAPIResponce> {
        return .init(
            path: "3/movie/\(id)",
            method: .get
        )
    }
    
  

        
   
}
