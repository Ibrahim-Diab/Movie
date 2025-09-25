//
//  MoviesViewModel.swift
//  MovieApp
//
//  Created by Diab on 25/09/2025.
//

import Combine

@MainActor
class MoviesViewModel: BaseViewModel {
    
    let navigationEvent = PassthroughSubject<HomeRoute, Never>()
    
    @Published  var movies: [MovieCardViewDataSource] = []
    @Published var movieListTypes:[SegmentButtonModel] = []
    @Published var isHorizontal: Bool = true
    private var currentPage: Int = 1
    private(set) var totalPages: Int = 1
    private var isFetching: Bool = false
    private var movieType: MovieListTypes = .nowPlaying
   
    
    private let useCase: MovieUseCaseProtocol
    
    init(useCase: MovieUseCaseProtocol) {
        self.useCase = useCase
    }
    
    // MARK: - Public
    
    func didLoad() {
        resetPagination()
        fetchMovies(page: currentPage)
        movieListTypes = useCase.createMovieListType()
        
    }
    
    func loadMoreMoviesIfNeeded(currentItem: MovieCardViewDataSource?) {
        guard let currentItem = currentItem else { return }
        let thresholdIndex = movies.index(movies.endIndex, offsetBy: -5)
        
        if movies.firstIndex(where: { $0.movieId == currentItem.movieId }) == thresholdIndex {
            fetchNextPage()
        }
    }
    
    // MARK: - Private
    
    private func fetchNextPage() {
        guard !isFetching, currentPage < totalPages else { return }
        currentPage += 1
        fetchMovies(page: currentPage)
    }
    
    private func fetchMovies(page: Int) {
        guard !isFetching else { return }
        isFetching = true
        viewState = .loading
        
        let publisher: AnyPublisher<MovieListAPIResponse, NetworkError>
        
        switch movieType {
        case .nowPlaying:
            publisher = useCase.getNowPlayingMovieData(page: page)
        case .popular:
            publisher = useCase.getPopularMovieData(page: page)
        case .upcoming:
            publisher = useCase.getUpcomingMovieData(page: page)
        }
        
        publisher
            .sink { [weak self] completion in
                guard let self else { return }
                self.isFetching = false
                switch completion {
                case .finished:
                    print("✅ Finished loading \(self.movieType) page \(page)")
                case .failure(let error):
                    print("❌ Error loading \(self.movieType): \(error.localizedDescription)")
                    self.viewState = .error(message: error.localizedDescription)
                }
            } receiveValue: { [weak self] data in
                guard let self else { return }
                self.viewState = .content
                self.totalPages = data.totalPages ?? 1
                guard let newMovies = data.results else { return }
                self.movies.append(contentsOf: newMovies)
            }
            .store(in: &cancellables)
    }
    
    private func resetPagination() {
        movies.removeAll()
        currentPage = 1
        totalPages = 1
        isFetching = false
    }
}


// MARK: - SegmenButtonDelegate
extension MoviesViewModel: SegmenButtonDelegate {

    func didChoiceSegment(id: Int) {
        guard let type = MovieListTypes(rawValue: id) else { return }
        movieType = type
        resetPagination()
        fetchMovies(page: currentPage)
        updateType(id)
    }
    
    func updateType(_ id:Int){
        movieListTypes = useCase.updateType(withId: id, in: movieListTypes)
    }

    
}

// MARK: - Routes
extension MoviesViewModel {
    
    func routeToDetail(movieId: Int) {
        navigationEvent.send(.movieDetails(id: movieId))
    }
    
}




