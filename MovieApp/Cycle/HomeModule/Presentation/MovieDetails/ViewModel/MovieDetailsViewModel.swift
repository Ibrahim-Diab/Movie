//
//  MoviesViewModel.swift
//  MovieApp
//
//  Created by Diab on 25/09/2025.
//

import Combine

@MainActor
class MovieDetailsViewModel: BaseViewModel {
    
    let navigationEvent = PassthroughSubject<HomeRoute, Never>()
    
    @Published var movieData: MovieDetailsDataSource?
    var movieID:Int
    
    private let useCase: MovieDetailsUseCaseProtocol
    
    init(useCase: MovieDetailsUseCaseProtocol,movieID:Int) {
        self.useCase = useCase
        self.movieID = movieID
    }
    
    // MARK: - Public
    
    func didLoad() {
        
        fetchMovieDetails()
    }
    
    
    private func fetchMovieDetails() {
        viewState = .loading
        useCase.getMovieDetailsData(id: movieID)
            .sink { [weak self] completion in
                guard let self else { return }
                switch completion {
                case .finished:
                    print("✅ Finished loading ")
                case .failure(let error):
                    print("❌ Error loading  \(error.localizedDescription)")
                    self.viewState = .error(message: error.localizedDescription)
                }
            } receiveValue: { [weak self] data in
                guard let self else { return }
                movieData = data
            }
            .store(in: &cancellables)
    }
    
}



