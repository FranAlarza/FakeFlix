//
//  FavoritesView.swift
//  FakeFlix
//
//  Created by Francisco Javier Alarza Sanchez on 15/5/23.
//

import SwiftUI

struct FavoritesView: View {
    @ObservedObject var viewModel = FavoritesViewModel()
    
    var body: some View {
        VStack {
            if viewModel.favoritesMovies.isEmpty {
                Text("You don't have Favorites")
            } else {
                List {
                    ForEach(viewModel.favoritesMovies) { movie in
                        MovieCell(movie: movie)
                    }
                    .onDelete(perform: viewModel.delete)
                }
            }
        }
        .onAppear {
            viewModel.getFavoriteMovies()
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
