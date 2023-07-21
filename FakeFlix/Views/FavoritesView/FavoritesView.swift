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
        NavigationView {
            VStack {
                if viewModel.favoritesMovies.isEmpty {
                    VStack(spacing: 16) {
                        Image(systemName: "camera")
                            .resizable()
                            .frame(width: 100, height: 100)
                        Text("You don't have favorites movies")
                    }
                    .foregroundColor(.white)
                } else {
                    List {
                        ForEach(viewModel.favoritesMovies) { movie in
                            NavigationLink {
                                DetailView(movie: movie)
                            } label: {
                                MovieCell(movie: movie)
                            }
                        }
                        .onDelete(perform: viewModel.delete)
                    }
                    .scrollContentBackground(.hidden)
                    .background(Color.darkBackgroundColor)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.darkBackgroundColor)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    CustomLetter()
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    CustomLogo()
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
