//
//  MovieViewModel.swift
//  MovieList
//
//  Created by Vivek Sehrawat on 22/09/23.
//

import Foundation

protocol IMovieViewModel {
    var movies: [Movie] { get set }
    func fetchMovies()
}
