//
//  MovieRepository.swift
//  MovieList
//
//  Created by Vivek Sehrawat on 22/09/23.
//

import Foundation

class MovieRepositoryImpl: IMovieRepository {
   
    private let remoteDataSource: IMovieService
    private let localDataSource: IMovieOfflineStorage

    init(movieService: IMovieService, movieOfflineServie: IMovieOfflineStorage ) {
        self.remoteDataSource = movieService
        self.localDataSource = movieOfflineServie
    }
    
    func fetchMovieList() async throws ->  [MovieDomainListDTO]{
        if Reachability().isNetworkAvailable() == false {
            let storageData = try await self.localDataSource.getMoviesFromStorage()
            return storageData.map { $0.toDomain() }
        }else{
            let response = try await self.remoteDataSource.fetchMoviesFromNetwork()
            self.localDataSource.save(movies: response)
            return response.map { $0.toDomain() }
        }
    }
}
