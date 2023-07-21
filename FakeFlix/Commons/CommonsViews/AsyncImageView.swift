//
//  AsyncImageView.swift
//  FakeFlix
//
//  Created by Francisco Javier Alarza Sanchez on 17/5/23.
//

import SwiftUI

enum ImageType {
    case custom
    case detail
}

struct AsyncImageView: View {
    let posterPath: String
    let movie: Movie
    let type: ImageType
    let width: CGFloat = 50
    let height: CGFloat = 50

    var body: some View {
        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(posterPath)")) { image in
                switch type {
                case .custom:
                    image
                        .resizable()
                        .frame(width: width, height: height)
                        .cornerRadius(8)
                case .detail:
                    image
                        .resizable()
                        .frame(width: 250)
                        .frame(maxHeight: .infinity)
                        .border(Color.white, width: 2)
                        .aspectRatio(contentMode: .fit)
                }
        } placeholder: {
            switch type {
            case .custom:
                Image("example_image")
                    .resizable()
                    .frame(width: 50, height: 50)
            case .detail:
                Image("example_image")
                    .resizable()
                    .frame(width: 250)
                    .frame(maxHeight: .infinity)
            }
        }
    }
}

struct AsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        AsyncImageView(posterPath: "", movie: Movie(adult: true, id: 1, originalLanguage: "", originalTitle: "", overview: "", popularity: 5.0, posterPath: "", releaseDate: "", title: "", voteAverage: 9.0), type: .custom)
    }
}
