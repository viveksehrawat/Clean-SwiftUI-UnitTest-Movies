//
//  MovieCellRow.swift
//  Movies
//
//  Created by Vivek Sehrawat on 22/11/23.
//

import SwiftUI

struct MovieRow: View {
    var movie: Movie
    var callback: (Bool) -> Void?
    
    @State var isFavorite: Bool = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(Color.white).shadow(radius: 2)
            
            HStack {
                
                
                let thumbURL = URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath)")
                
                AsyncImage(url: thumbURL) { image in
                    image.resizable()
                } placeholder: {
                    Color.gray
                }
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(movie.title)
                        .font(.system(size: 20))
                        .bold()
                    Text(movie.overview)
                        .font(.system(size: 12))
                        .lineLimit(2)

                    Button(action: {
                        isFavorite = movie.isFavorite
                        isFavorite = !isFavorite
                        callback(isFavorite)
                    }) {
                        if movie.isFavorite {
                            Image(systemName: "heart.fill").foregroundColor(Color.red)
                        } else {
                            Image(systemName: "heart.fill").foregroundColor(Color.gray)
                        }
                    }
                }
            }
            .padding(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
            .frame(
                maxWidth: .infinity,
                maxHeight: .infinity,
                alignment: .topLeading
            )
        }
        .padding(10)
    }
}
