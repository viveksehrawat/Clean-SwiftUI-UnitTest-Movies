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
    @Published private(set) var state = State.idle

    enum State {
        case idle
        case loading
        case failure(Error)
        case loaded([Movie])
    }
    
   @Published var movies: [Movie] = [Movie]()

    @MainActor
    func fetchMovies(){
        print("====== Fetchig Movies ========")
        state = .loading
        Task{
            do {
                 movies = try await useCase.fetchMovieList()
                state = .loaded(movies)
            } catch {
                state = .failure(error)
                print(error.localizedDescription)
                throw error
            }
        }
    }
}
