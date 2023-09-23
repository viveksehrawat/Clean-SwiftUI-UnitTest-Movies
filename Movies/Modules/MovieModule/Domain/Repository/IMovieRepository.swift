//
//  IMovieRepository.swift
//  MovieList
//
//  Created by Vivek Sehrawat on 22/09/23.
//

import Foundation

protocol IMovieRepository {
    func fetchMovieList() async throws ->  [MovieDomainListDTO]
}
