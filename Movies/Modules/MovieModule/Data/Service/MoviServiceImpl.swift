//
//  MoviServiceImpl.swift
//  MovieList
//
//  Created by Vivek Sehrawat on 22/09/23.
//

import Foundation

class MovieServiceImpl: IMovieService {
        
    private let networkManager: INetworkManager
    
    init(networkManager: INetworkManager) {
        self.networkManager = networkManager
    }

    func fetchMoviesFromNetwork() async throws -> [MovieDataListDTO]{
        let path = "/3/movie/now_playing"
        let request = NetworkRequest(path: path, method: .get, queryParameters: ["api_key": "2696829a81b1b5827d515ff121700838"])
        do{
           let response = try await networkManager.request(request: request, responseType: MovieApiResponse.self)
            return response.results
        } catch{
            throw error
        }
    }
}
