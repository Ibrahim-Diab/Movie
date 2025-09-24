//
//  NetworkImageConfig.swift
//  MovieApp
//
//  Created by Diab on 24/09/2025.
//

import Foundation

extension Optional where Wrapped == String {
    
    func asImageBaseURLString() -> String {
        guard let path = self, !path.isEmpty else { return "" }
        return NetworkConfig.imageBaseUrl + path
    }
}
