//
//  MovieListApp.swift
//  MovieList
//
//  Created by Vivek Sehrawat on 22/09/23.
//

import SwiftUI
// https://proandroiddev.com/clean-architecture-data-flow-dependency-rule-615ffdd79e29
@main
struct MoviesApp: App {
        
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: generateMovieViewModel())
        }
    }
    
    var networkManager: INetworkManager = {
        let networkManager = NetworkManager()
        return networkManager
    }()
    // below one should be in
    private func generateMovieViewModel() -> MovieViewModel {
        let viewModel = MovieViewModel(useCase: generateMovieUseCase())
        return viewModel
    }
    
    private func generateMovieUseCase() -> IMovieUseCase {
        let useCase = MovieUseCaseImpl(respository: generateMovieRepository())
        return useCase
    }
    
    private func generateMovieRepository() -> IMovieRepository {
        let repository = MovieRepositoryImpl(service: generateMovieService())
        return repository
    }
    
    private func generateMovieService() -> IMovieService {
        let service = MovieServiceImpl(networkManager: networkManager)
        return service
    }
    
}
