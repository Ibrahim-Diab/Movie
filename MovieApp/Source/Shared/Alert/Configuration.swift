//
//  Configuration.swift
//  MovieApp
//
//  Created by Diab on 24/09/2025.
//

import SwiftUI

enum AlertType {
    case success(message: String)
    case error(message: String)
    
    var icon: String {
        switch self {
        case .success:
            return "like_icon"
        case .error:
            return "dislike_icon"
        }
    }
    
    var iconColor: Color {
        return .white
    }
    
    var message: String {
        switch self {
        case let .success(message):
            return message
        case let .error(message):
            return message
        }
    }
    
    
    var lineColor: Color {
        return .white
    }
    
    var bacgroundColor:Color{
        switch self {
        case .success:
            return Theme.colors.primary
        case .error:
            return Theme.colors.alert
        }
    }
}
