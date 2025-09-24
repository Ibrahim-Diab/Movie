//
//  NetworkError.swift
//  MovieApp
//
//  Created by Diab on  24/09/2025.
//


import Foundation

public enum NetworkError: Error {
    case invalidURL
    case decodingError(Error)
    case serverError(Int)
    case unknown(Error)
    
public  var errorDescription: String? {
        switch self {
        case .invalidURL: return "Invalid URL"
        case let .decodingError(error): return "Data parsing error: \(errorDescription)"
        case let  .serverError(code): return "Server error with code \(code)"
        case let  .unknown(error): return "Unknown error: \(errorDescription)"
        }
    }
    
}

extension NetworkError: Equatable {
    public static func == (lhs: NetworkError, rhs: NetworkError) -> Bool {
        switch (lhs, rhs) {
        case (.invalidURL, .invalidURL):
            return true
        case (.serverError(let lcode), .serverError(let rcode)):
            return lcode == rcode
        case (.decodingError, .decodingError):
            return true
        case (.unknown, .unknown):
            return true
        default:
            return false
        }
    }
}
