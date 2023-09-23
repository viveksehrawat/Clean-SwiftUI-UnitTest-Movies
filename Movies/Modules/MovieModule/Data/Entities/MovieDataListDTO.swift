//
//  PostDataListDTO.swift
//  MovieList
//
//  Created by Vivek Sehrawat on 22/09/23.
//

import Foundation


struct MovieApiResponse: Codable {

    let results: [MovieDataListDTO]

}

struct MovieDataListDTO: Codable {

    let title: String

    let overview: String

    let poster_path: String

    let release_date: String

}
extension MovieDataListDTO {
    func toDomain() -> MovieDomainListDTO{
        return .init(title: title, overview: overview, posterPath: poster_path, releaseDate: release_date)
    }
}
