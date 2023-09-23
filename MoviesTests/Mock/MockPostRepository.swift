//
//  MockPostRepository.swift
//  MoviesTests
//
//  Created by Vivek Sehrawat on 23/09/23.
//

import Foundation
@testable import Movies

class MockPostRepository: IMovieRepository {
    
    var movies: [MovieDomainListDTO]?
    var error: Error?
    
    func fetchMovieList() async throws ->  [MovieDomainListDTO]{
        if let error = error {
            throw error
        }
        if let movies = movies {
            return movies
        } else {
            throw NetworkError.invalidResponse
        }
       
    }
}
