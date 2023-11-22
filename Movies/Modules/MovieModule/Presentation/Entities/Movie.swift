//
//  Movi.swift
//  MovieList
//
//  Created by Vivek Sehrawat on 22/09/23.
//

import Foundation

struct Movie: Identifiable {

    let id: UUID = UUID()
    let title: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    var isFavorite: Bool = false

}
