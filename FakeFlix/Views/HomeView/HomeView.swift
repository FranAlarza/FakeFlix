//
//  HomeView.swift
//  FakeFlix
//
//  Created by Francisco Javier Alarza Sanchez on 15/5/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State var isTopSelected = true
    @State var isPopularSelected = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                TypeSelectorView(isSelectedTop: $isTopSelected, isSelectedPopular: $isPopularSelected, typeCollectionMovie: $viewModel.currententCollectionMovie)
                collectionMovies
            }
            .searchable(text: $viewModel.query) {
                ForEach(viewModel.searchedMovies?.results ?? []) { sugestion in
                    NavigationLink {
                        DetailView(movie: sugestion)
                    } label: {
                        HStack(spacing: 16) {
                            AsyncImageView(posterPath: sugestion.posterPath ?? "", movie: sugestion, type: .custom)
                            Text(sugestion.originalTitle ?? "")
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            .onChange(of: viewModel.query, perform: { _ in
                Task {
                    await viewModel.searchMoviesByName()
                }
            })
            .background(Color.darkBackgroundColor)
            .onAppear {
                Task {
                    if viewModel.popularMovies?.results?.isEmpty ?? true {
                        await viewModel.getMovies()
                    }
                    
                    if viewModel.topRatedMovies?.results?.isEmpty ?? true {
                        await viewModel.getTopRatedMovies()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    CustomLetter()
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    CustomLogo()
                }
            }
        }
    }
    
    var collectionMovies: some View {
        VStack {
            switch viewModel.currententCollectionMovie {
            case .topMovies:
                ScrollMovies(movies: viewModel.topRatedMovies?.results ?? [], title: "Popular Movies", isError: $viewModel.isErrorTopRates)
            case .popularMovies:
                ScrollMovies(movies: viewModel.popularMovies?.results ?? [], title: "Popular Movies", isError: $viewModel.isErrorPopular)
            }
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
