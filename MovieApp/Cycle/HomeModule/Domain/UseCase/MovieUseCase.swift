//
//  MovieUseCase.swift
//  MovieApp
//
//  Created by Diab on 25/09/2025.
//


import Combine

class MovieUseCase:MovieUseCaseProtocol{
    
    private let repository: HomeRepositoryProtocol
    
    init(
        repository: HomeRepositoryProtocol
    ) {
        self.repository = repository
    }
    
    deinit {
        print("🟢 \(Self.self) is deinit, No memory leak found")
    }
    
    func getNowPlayingMovieData(page: Int) -> AnyPublisher<MovieListAPIResponse, NetworkError> {
        repository.getNowPlayingMovieData(page: page)
    }
    
    func getPopularMovieData(page: Int) -> AnyPublisher<MovieListAPIResponse, NetworkError> {
        repository.getPopularMovieData(page: page)
    }
    
    func getUpcomingMovieData(page: Int) -> AnyPublisher<MovieListAPIResponse, NetworkError> {
        repository.getUpcomingMovieData(page: page)
    }
    
    func createMovieListType() -> [SegmentButtonModel] {
        repository.createMovieListType()
    }
    
    func updateType(withId id: Int, in list: [SegmentButtonModel]) -> [SegmentButtonModel] {
           var updatedList = list
           updatedList.indices.forEach { updatedList[$0].isSelected = false }
           
           if let index = updatedList.firstIndex(where: { $0.id == id }) {
               updatedList[index].isSelected = true
           }
           
           return updatedList
       }
    
    
}
