//
//  ViewState.swift
//  MovieApp
//
//  Created by Diab on 24/09/2025.
//

// MARK: - View State
enum ViewState: Equatable {
    case content
    case loading
    case empty(message: String? = nil,describtion: String? = nil)
    case error(message: String)
    case showSuccessAlert(message: String)
}
