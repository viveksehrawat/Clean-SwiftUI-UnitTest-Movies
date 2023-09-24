//
//  MovieView.swift
//  Movies
//
//  Created by Vivek Sehrawat on 24/09/23.
//

import SwiftUI

struct MovieCellView: View {
    let movie: Movie
    @EnvironmentObject var vm: MovieViewModel
    
    var body: some View {
        
        VStack {
            thumbnailView()
            Text(movie.title)
        }
        .frame(height: 200)
        .background(Color(.black))
        .cornerRadius(10)
    }
    
    private func thumbnailView() -> some View {
        let thumbURL = URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath)")
        return AsyncImage(url: thumbURL) { phase in
            switch phase {
            case .empty:
                ProgressView()
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                
            case .failure:
                Image(systemName: "exclamationmark.icloud.fill")
                    .font(.system(size: 40))
                    .foregroundColor(.red)
                
            @unknown default:
                EmptyView()
            }
        }
    }
}

struct MovieCellView_Previews: PreviewProvider {
    static let movie = Movie(title: "", overview: "", posterPath: "https://image.tmdb.org/t/p/w500/kdPMUMJzyYAc4roD52qavX0nLIC.jpg", releaseDate: "")
    static var previews: some View {
        MovieCellView(movie: movie)
    }
}
