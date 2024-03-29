//
//  MovieCell.swift
//  FakeFlix
//
//  Created by Francisco Javier Alarza Sanchez on 16/5/23.
//

import SwiftUI

struct MovieCell: View {
    var movie: Movie
    var body: some View {
        HStack(spacing: 8) {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath ?? "")")) { image in
                image
                    .resizable()
                    .frame(width: 120, height: 100)
                    .cornerRadius(8)
            } placeholder: {
                Image("example_image")
                    .resizable()
                    .frame(width: 120, height: 100)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text(movie.originalTitle ?? "")
                    .bold()
                Text(movie.overview ?? "")
                    .lineLimit(4)
                    .font(.caption)
            }
        }
        
    }
}

struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell(movie: Movie(adult: true, id: 1, originalLanguage: "", originalTitle: "", overview: "", popularity: 10.0, posterPath: "", releaseDate: "", title: "", voteAverage: 9.0))
    }
}
