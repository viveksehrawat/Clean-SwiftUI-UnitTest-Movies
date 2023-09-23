//
//  IMovieService.swift
//  MovieList
//
//  Created by Vivek Sehrawat on 22/09/23.
//

import Foundation

protocol IMovieService {
    func fetchMoviesFromNetwork() async throws -> [MovieDataListDTO]
}
