//
//  TypeSelectorView.swift
//  FakeFlix
//
//  Created by Francisco Javier Alarza on 20/7/23.
//

import SwiftUI

enum CollectionMovieType: String {
    case topMovies = "Top Movies"
    case popularMovies = "Popular Movies"
}

struct TypeSelectorView: View {
    @Binding var isSelectedTop: Bool
    @Binding var isSelectedPopular: Bool
    @Binding var typeCollectionMovie: CollectionMovieType
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack {
                Button {
                    isSelectedTop.toggle()
                    isSelectedPopular.toggle()
                    typeCollectionMovie = .topMovies
                } label: {
                    Text("Top Movies")
                        .modifier(ButtonTypeMovieSelector(isSelected: isSelectedTop))
                }
                
                Button {
                    isSelectedTop.toggle()
                    isSelectedPopular.toggle()
                    typeCollectionMovie = .popularMovies
                } label: {
                    Text("Popular Movies")
                        .modifier(ButtonTypeMovieSelector(isSelected: isSelectedPopular))
                }
            }
            .padding()
        }
    }
}

struct TypeSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        TypeSelectorView(isSelectedTop: .constant(true), isSelectedPopular: .constant(false), typeCollectionMovie: .constant(.topMovies))
    }
}
