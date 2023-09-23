//
//  MovieUseCaseImpl.swift
//  MovieList
//
//  Created by Vivek Sehrawat on 22/09/23.
//

import Foundation

class MovieUseCaseImpl: IMovieUseCase {
    
    private let respository: IMovieRepository
    init(respository: IMovieRepository) {
        self.respository = respository
    }
    
    func fetchMovieList() async throws -> [Movie] {
        let movies = try await self.respository.fetchMovieList()
        return movies.map { $0.toPresentation() }
    }
}
