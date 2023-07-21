//
//  ContentView.swift
//  FakeFlix
//
//  Created by Francisco Javier Alarza Sanchez on 15/5/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                        .foregroundColor(.white)
                    Text("Home")
                        .foregroundColor(.white)
                }
            FavoritesView()
                .tabItem {
                    Image(systemName: "heart")
                        .foregroundColor(.white)
                    Text("Favorites")
                        .foregroundColor(.white)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
