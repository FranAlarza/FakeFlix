//
//  ScrollMovies.swift
//  FakeFlix
//
//  Created by Francisco Javier Alarza Sanchez on 15/5/23.
//

import SwiftUI

struct ScrollMovies: View {
    var movies: [Movie] = []
    var title = ""
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    @Binding var isError: Bool
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ScrollView(.vertical) {
                if isError {
                    VStack {
                        Text("We can't load the movies")
                    }
                } else {
                    LazyVGrid(columns: columns) {
                        ForEach(movies) { movie in
                            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath ?? "")")) { image in
                                NavigationLink {
                                    DetailView(movie: movie)
                                } label: {
                                    image
                                        .resizable()
                                        .frame(minWidth: 60)
                                        .frame(height: 170)
                                        .cornerRadius(8)
                                        .padding(8)
                                }
                            } placeholder: {
                                ZStack {
                                    Rectangle()
                                        .frame(minWidth: 60)
                                        .frame(height: 170)
                                        .cornerRadius(8)
                                        .padding(8)
                                    Text("Can`t load the poster")
                                }
                            }
                            
                        }
                    }
                }
            } // End Of ScrollView
        } // End of VStack
    }
}

struct ScrollMovies_Previews: PreviewProvider {
    static var previews: some View {
        ScrollMovies(movies: [], title: "Title", isError: .constant(false))
    }
}
