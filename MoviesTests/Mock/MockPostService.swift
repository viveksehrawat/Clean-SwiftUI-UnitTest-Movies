//
//  MockPostService.swift
//  MoviesTests
//
//  Created by Vivek Sehrawat on 23/09/23.
//

import Foundation
@testable import Movies

class MockMovieService: IMovieService {
    
    var response: [MovieDataListDTO]?
    var error: Error?
    
    func fetchMoviesFromNetwork() async throws -> [MovieDataListDTO]{
        
        if let error = error {
            throw error
        }
        if let response = response {
            return response
        } else {
            throw NetworkError.invalidResponse
        }
    }
}
