//
//  HomeDTO.swift
//  MovieApp
//
//  Created by Diab on 25/09/2025.
//

import Foundation

typealias MovieListAPIResponse = MovieDTO

struct MovieDTO: Codable {
    var page: Int?
    var results: [Result]?
    var totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Result: Codable {
    var adult: Bool?
    var backdropPath: String?
    var genreIDS: [Int]?
    var id: Int?
    var originalLanguage: String?
    var originalTitle, overview: String?
    var popularity: Double?
    var posterPath, releaseDate, title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}



extension Result:MovieCardViewDataSource{
    
    var movieId: Int {
        return id ?? 0
    }
    
    var movieTitle: String {
        return title ?? ""
    }
    
    var movieReleaseDate: String {
        return releaseDate ?? ""
    }
    
    var moviePosterImage: String {
        return backdropPath.asImageBaseURLString()
    }
}

