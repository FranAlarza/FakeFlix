//
//  DetailView.swift
//  FakeFlix
//
//  Created by Francisco Javier Alarza Sanchez on 16/5/23.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var viewModel = DetailViewModel()
    @State var isFavorite = false
    var movie: Movie
    var body: some View {
        VStack(spacing: 16) {
            header
                .padding()
            movieInfo
                .padding()
        }
        .onAppear {
            viewModel.loadFavorites()
            isFavorite = viewModel.checkIfIsFavorite(movie: movie)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.darkBackgroundColor)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isFavorite
                    ? viewModel.deleteFavorite(movie: movie)
                    : viewModel.saveFavorite(movie: movie)
                    isFavorite.toggle()
                } label: {
                    HStack {
                        Spacer()
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                    }
                }
            }
            
            ToolbarItem(placement: .principal) {
                Image("f_letter")
                    .resizable()
                    .frame(width: 80, height: 40)
            }
        }
    }
    
    var header: some View {
        HStack(spacing: 16) {
            AsyncImageView(posterPath: movie.posterPath ?? "", movie: movie, type: .detail)
                .frame(maxHeight: .infinity)
                .border(Color.white, width: 2)
                .cornerRadius(4)
            VStack {
                FeatureBox(image: "star", type: "Vote Average", info: movie.voteAverage?.roundedToOneDecimal ?? "N/D")
                FeatureBox(image: "globe", type: "Original Language", info: movie.originalLanguage ?? "No data")
                FeatureBox(image: "calendar", type: "Release Date", info: movie.releaseDate ?? "")
            }
            .frame(maxHeight: .infinity)
            
        }
    }
    
    var movieInfo: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Text(movie.title ?? "Title")
                    .foregroundColor(.white)
                    .font(.title3)
                    .bold()
                Spacer()
            }
            Text(movie.overview ?? "Overview")
                .foregroundColor(.gray)
                .font(.caption)
                .multilineTextAlignment(.leading)
                .lineSpacing(4)
        }
        
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movie: Movie(adult: true, id: 1, originalLanguage: "", originalTitle: "", overview: "Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor ", popularity: 10.0, posterPath: "", releaseDate: "", title: "Encanto", voteAverage: 9.0))
    }
}
