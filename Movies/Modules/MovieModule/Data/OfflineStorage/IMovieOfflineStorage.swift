//
//  MovieStorage.swift
//  Movies
//
//  Created by Vivek Sehrawat on 24/11/23.
//

import Foundation

protocol IMovieOfflineStorage{
    func getMoviesFromStorage() async throws -> [MovieDataListDTO]
    func save(movies: [MovieDataListDTO])
}
