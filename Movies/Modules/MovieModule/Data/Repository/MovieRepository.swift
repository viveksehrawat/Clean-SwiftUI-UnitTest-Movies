//
//  MovieRepository.swift
//  MovieList
//
//  Created by Vivek Sehrawat on 22/09/23.
//

import Foundation

class MovieRepositoryImpl: IMovieRepository {
   
    private let service: IMovieService
    init(service: IMovieService) {
        self.service = service
    }
    
    func fetchMovieList() async throws ->  [MovieDomainListDTO]{
        let response = try await self.service.fetchMoviesFromNetwork()
        return response.map { $0.toDomain() }
    }
}
