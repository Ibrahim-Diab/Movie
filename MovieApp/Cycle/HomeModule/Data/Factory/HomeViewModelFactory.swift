//
//  HomeViewModelFactory.swift
//  MovieApp
//
//  Created by Diab on 25/09/2025.
//

import Foundation

@MainActor
protocol HomeViewModelFactoryProtocol {
    func buildMoviesViewModel() -> MoviesViewModel
    func buildMovieDetailsViewModel(id:Int) -> MovieDetailsViewModel
}

class HomeViewModelFactory: HomeViewModelFactoryProtocol {
    
    struct Dependencies {
        let apiDataTransferService: NetworkExecutor
    }
    
    let dependencies: Dependencies
    
    // MARK: - Init -
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
     
        //Repo
    private lazy var repository:HomeRepositoryProtocol = {
        return HomeRepository(networkService: NetworkService(executor:dependencies.apiDataTransferService))
    }()
        
    // MoviesUseCase
    private lazy var buildMovieUseCase:MovieUseCaseProtocol = {
        return MovieUseCase(
            repository: repository) }()
    
    // MovieDetailsUseCase
    private lazy var buildMovieDetailsUseCase:MovieDetailsUseCaseProtocol = {
        return MovieDetailsUseCase(
            repository: repository) }()
    
    // MoviesViewModel
    func buildMoviesViewModel() -> MoviesViewModel {
        return MoviesViewModel(useCase: buildMovieUseCase)
    }
    
    // MovieDetailsViewModel
    func buildMovieDetailsViewModel(id:Int) -> MovieDetailsViewModel {
        return MovieDetailsViewModel(useCase: buildMovieDetailsUseCase, movieID: id)
    }
   
}

