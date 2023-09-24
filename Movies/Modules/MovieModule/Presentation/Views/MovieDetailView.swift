//
//  MovieDetailView.swift
//  Movies
//
//  Created by Vivek Sehrawat on 24/09/23.
//

import SwiftUI

struct MovieDetailView: View {
    var selectedMovie: Movie
    var body: some View {
        Text("Selected movie  is \(selectedMovie.title)")
    }
}

//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailView()
//    }
//}
