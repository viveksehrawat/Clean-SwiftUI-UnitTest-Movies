//
//  MockData.swift
//  MoviesTests
//
//  Created by Vivek Sehrawat on 23/09/23.
//

import Foundation

@testable import Movies

class MockData {
    
    static var movies: [MovieDataListDTO] {
        
         movieResponse.results
        
    }
    
    static var movieResponse: MovieApiResponse {
        let response = try! JSONDecoder().decode(MovieApiResponse.self, from: moviesData)
        return response
    }
    static var domainMovies: [MovieDomainListDTO] {
        return movies.map { $0.toDomain() }
    }
    
    static var moviesList: [Movie] {
        return domainMovies.map { $0.toPresentation() }
    }
    
    static var moviesData: Data {
        loadJsonData("Movies")
    }
    
    static func loadJsonData(_ fromFile: String) -> Data {
        let path = Bundle(for: self).path(forResource: fromFile, ofType: "json")
        let jsonString = try! String(contentsOfFile: path!, encoding: .utf8)
        let data = jsonString.data(using: .utf8)!
        return data
    }
}
