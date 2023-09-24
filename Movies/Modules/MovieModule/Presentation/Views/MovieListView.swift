//
//  ContentView.swift
//  MovieList
//
//  Created by Vivek Sehrawat on 22/09/23.
//

import SwiftUI

struct MovieListView: View {
    @ObservedObject private(set) var viewModel: MovieViewModel
    private let adaptiveColumns = [
//        GridItem(.adaptive(minimum: 150))
        GridItem(.flexible(), spacing: 10),
           GridItem(.flexible(), spacing: 10),
           GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        switch viewModel.state{
        case .idle:
            Color.clear.onAppear(perform: viewModel.fetchMovies)
        case .loading:
            ProgressView()
        case .failure(let error):
            Text(error.localizedDescription)
        case .loaded(let movies):
            createMoviList(movies: movies)
            
        }
    }
    
    
    func createMoviList(movies: [Movie]) -> some View{
        ScrollView{
            LazyVGrid(columns: adaptiveColumns, spacing: 10){
                ForEach(movies){ movie in
                    NavigationLink(destination: MovieDetailView(selectedMovie: movie)) {
                        MovieCellView(movie: movie)
                            .environmentObject(viewModel)
                    }
                }
            }
        }
        .navigationTitle("Trending Movies")
        .padding(.horizontal, 10)
    }
}
