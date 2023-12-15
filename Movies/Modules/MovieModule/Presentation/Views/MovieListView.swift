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
    var body: some View {
        AsyncContentView(source: viewModel) { movies in
            ScrollView{
                LazyVStack {
                    ForEach(movies, id: \.id) { movie in

                        NavigationLink(
                            destination: MovieDetailView(selectedMovie: movie),
                            label: {
                                MovieRow(movie: movie){ favorState in
                                }
                            })
                        .navigationTitle("Trending Movies")
                        .padding(.horizontal, 10)
                    }
                }
            }
        }
    }
}
