//
//  IMovieUseCase.swift
//  MovieList
//
//  Created by Vivek Sehrawat on 22/09/23.
//

import Foundation

protocol IMovieUseCase {
    func fetchMovieList() async throws -> [Movie]
}
