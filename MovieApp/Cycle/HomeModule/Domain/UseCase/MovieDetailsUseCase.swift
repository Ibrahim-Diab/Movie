//
//  MovieDetailsUseCaseProtocol.swift
//  MovieApp
//
//  Created by Diab on 25/09/2025.
//


import Combine

class MovieDetailsUseCase:MovieDetailsUseCaseProtocol{
    
    private let repository: HomeRepositoryProtocol
    
    init(
        repository: HomeRepositoryProtocol
    ) {
        self.repository = repository
    }
    
    deinit {
        print("🟢 \(Self.self) is deinit, No memory leak found")
    }
    
    func getMovieDetailsData(id: Int) -> AnyPublisher<MovieDetailsAPIResponce, NetworkError> {
        repository.getMovieDetailsData(id: id)
    }
    
}
