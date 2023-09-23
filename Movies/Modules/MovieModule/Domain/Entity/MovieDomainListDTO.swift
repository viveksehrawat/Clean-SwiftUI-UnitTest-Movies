//
//  MovieDomainListDTO.swift
//  MovieList
//
//  Created by Vivek Sehrawat on 22/09/23.
//

import Foundation

struct MovieDomainListDTO: Equatable {

    let title: String

    let overview: String

    let posterPath: String

    let releaseDate: String

}
extension MovieDomainListDTO {
    func toPresentation() -> Movie {
        return .init(title: title, overview: overview, posterPath: posterPath, releaseDate: releaseDate)
    }
}
