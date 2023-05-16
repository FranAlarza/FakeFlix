//
//  AppRepositoryFake.swift
//  FakeFlixTests
//
//  Created by Francisco Javier Alarza Sanchez on 16/5/23.
//

import Foundation
@testable import FakeFlix

class AppRepositoryFake: Repository {
    
    var moviesToLoad: [Movie] = []
    
    
    func store(_ data: Encodable, key: String) {
        let movieToAdd = Movie(adult: true, id: 12, originalLanguage: "", originalTitle: "", overview: "", popularity: 1.0, posterPath: "", releaseDate: "", title: "", voteAverage: 5.0)
        if key == StorageKeys.KEY_FAVORITES {
            moviesToLoad.append(movieToAdd)
        }
    }
    
    func load<T>(forKey key: String, as type: T.Type) -> T? where T : Decodable {
        if key == StorageKeys.KEY_POPULAR_MOVIES {
            return PopularMovies(page: 1, results: [Movie(adult: true, id: 1, originalLanguage: "", originalTitle: "", overview: "", popularity: 5.0, posterPath: "", releaseDate: "", title: "", voteAverage: 9.0)], totalPages: 1, totalResults: 10) as? T
        } else if key == StorageKeys.KEY_FAVORITES {
            return moviesToLoad as? T
        }
        return nil
    }
    
    func delete(key: String) {
        //
    }
    
    
}
