//
//  MovieDetailsDTO.swift
//  MovieApp
//
//  Created by Diab on 25/09/2025.
//

import Foundation

typealias MovieDetailsAPIResponce = MovieDetailsDTO

struct MovieDetailsDTO: Codable {
    var runtime: Int?
    var status, backdropPath, overview, title: String?
    var voteCount: Int?
    var tagline: String?
    var belongsToCollection: BelongsToCollection?
    var originalTitle, originalLanguage, posterPath: String?
    var originCountry: [String]?
    var productionCountries: [ProductionCountry]?
    var homepage: String?
    var revenue: Int?
    var imdbID: String?
    var video: Bool?
    var id: Int?
    var releaseDate: String?
    var budget: Int?
    var popularity: Double?
    var genres: [Genre]?
    var productionCompanies: [ProductionCompany]?
    var adult: Bool?
    var spokenLanguages: [SpokenLanguage]?
    var voteAverage: Double?

    enum CodingKeys: String, CodingKey {
        case runtime, status
        case backdropPath = "backdrop_path"
        case overview, title
        case voteCount = "vote_count"
        case tagline
        case belongsToCollection = "belongs_to_collection"
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case posterPath = "poster_path"
        case originCountry = "origin_country"
        case productionCountries = "production_countries"
        case homepage, revenue
        case imdbID = "imdb_id"
        case video, id
        case releaseDate = "release_date"
        case budget, popularity, genres
        case productionCompanies = "production_companies"
        case adult
        case spokenLanguages = "spoken_languages"
        case voteAverage = "vote_average"
    }
}

// MARK: - BelongsToCollection
struct BelongsToCollection: Codable {
    var backdropPath: String?
    var id: Int?
    var name, posterPath: String?

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id, name
        case posterPath = "poster_path"
    }
}

// MARK: - Genre
struct Genre: Codable {
    var id: Int?
    var name: String?
}

// MARK: - ProductionCompany
struct ProductionCompany: Codable {
    var logoPath: String?
    var id: Int?
    var originCountry, name: String?

    enum CodingKeys: String, CodingKey {
        case logoPath = "logo_path"
        case id
        case originCountry = "origin_country"
        case name
    }
}

// MARK: - ProductionCountry
struct ProductionCountry: Codable {
    var name, iso3166_1: String?

    enum CodingKeys: String, CodingKey {
        case name
        case iso3166_1 = "iso_3166_1"
    }
}

// MARK: - SpokenLanguage
struct SpokenLanguage: Codable {
    var englishName, name, iso639_1: String?

    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case name
        case iso639_1 = "iso_639_1"
    }
}


extension MovieDetailsDTO:MovieDetailsDataSource{
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
        return posterPath.asImageBaseURLString()
    }
    
    var movieOverview: String {
        return overview ?? ""
    }
    
    var movieGenere: [Genre] {
        return genres ?? []
    }
    
    var movieRunTime: String {
        return "\(runtime ?? 0)"
    }
    
    var movieProductionCompaniesLogo: [String]{
        var data = [String]()
        data = productionCompanies?.compactMap { $0.logoPath.asImageBaseURLString() } ?? []
        return data

    }
    
    var movieGenereText: String {
        genres?.map { $0.name ?? "" }.joined(separator: ", ") ?? ""
    }
    
}
