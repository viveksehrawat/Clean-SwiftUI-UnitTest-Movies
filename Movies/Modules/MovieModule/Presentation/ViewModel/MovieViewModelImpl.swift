//
//  MovieViewModelImpl.swift
//  MovieList
//
//  Created by Vivek Sehrawat on 22/09/23.
//

import Foundation

class MovieViewModel: ObservableObject{
    private let useCase: IMovieUseCase
        
    init(useCase: IMovieUseCase) {
        self.useCase = useCase
    }
    
   @Published var movies: [Movie] = [Movie]()

    @MainActor
    func fetchMovies(){
        Task{
            do {
                 movies = try await useCase.fetchMovieList()
            } catch {
                print(error.localizedDescription)
                throw error
            }
        }
    }
}
