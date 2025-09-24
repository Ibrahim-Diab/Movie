//
//  NetworkConfig.swift
//  MovieApp
//
//  Created by Diab on  24/09/2025.
//

import Foundation

public enum NetworkConfig {
    static var apiKey: String {
        Bundle.main.object(forInfoDictionaryKey: "API_Key") as? String ?? ""
    }
    
    static var baseUrl: String {
        Bundle.main.object(forInfoDictionaryKey: "API_BASE_URL") as? String ?? ""
    }
    
    static var imageBaseUrl: String {
        Bundle.main.object(forInfoDictionaryKey: "IMAGE_BASE_URL") as? String ?? ""
    }
}




