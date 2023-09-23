//
//  ContentView.swift
//  MovieList
//
//  Created by Vivek Sehrawat on 22/09/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject private(set) var viewModel: MovieViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world! \(viewModel.movies.count)")
        }
        .onAppear{
            viewModel.fetchMovies()
        }
        .padding()
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(viewModel: MovieViewModel())
//    }
//}
