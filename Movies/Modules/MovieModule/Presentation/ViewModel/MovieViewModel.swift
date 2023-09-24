//
//  MovieViewModelImpl.swift
//  MovieList
//
//  Created by Vivek Sehrawat on 22/09/23.
//

import Foundation

class MovieViewModel: LoadableObject{

    private let useCase: IMovieUseCase
    typealias Output = [Movie]
    @Published private(set) var state = LoadingState<Output>.idle
    @Published var movies: [Movie] = [Movie]()
    
    init(useCase: IMovieUseCase) {
        self.useCase = useCase
    }
    
    
    
    @MainActor
    func load(){
        state = .loading
        Task{
            do {
                movies = try await useCase.fetchMovieList()
                state = .loaded(movies)
            } catch {
                state = .failed(error)
                print(error.localizedDescription)
            }
        }
    }
}
