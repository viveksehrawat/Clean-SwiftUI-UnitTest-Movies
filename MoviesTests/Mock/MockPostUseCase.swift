//
//  MockPostUseCase.swift
//  MoviesTests
//
//  Created by Vivek Sehrawat on 23/09/23.
//

import Foundation

@testable import Movies

class MockPostUseCase: IMovieUseCase {
    
    var movies: [Movie]?
    var error: Error?
    
    func fetchMovieList() async throws -> [Movie]{
        if let error = error {
            throw error
        }
        if let movies = movies {
            return movies
        }else {
            throw NetworkError.invalidResponse
        }
    }
}

