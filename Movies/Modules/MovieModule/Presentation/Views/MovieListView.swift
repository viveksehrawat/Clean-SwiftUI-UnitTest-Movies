//
//  ContentView.swift
//  MovieList
//
//  Created by Vivek Sehrawat on 22/09/23.
//

import SwiftUI
// https://dribbble.com/shots/20697408-Movie-app
struct MovieListView: View {
    @ObservedObject private(set) var viewModel: MovieViewModel
    private let adaptiveColumns = [
        //        GridItem(.adaptive(minimum: 150))
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10),
        GridItem(.flexible(), spacing: 10)
    ]
    
    var body: some View {
        
        AsyncContentView(source: viewModel) { movies in
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
}
