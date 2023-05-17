//
//  MovieServiceMock.swift
//  FakeFlixTests
//
//  Created by Francisco Javier Alarza Sanchez on 16/5/23.
//

import Foundation
@testable import FakeFlix

final class MovieServiceMock: MovieServiceProtocol {
    func searchMovies(request: FakeFlix.MovieRequest) async throws -> FakeFlix.PopularMovies {
        return PopularMovies(page: 1, results: [Movie(adult: true, id: 1, originalLanguage: "", originalTitle: "", overview: "", popularity: 5.0, posterPath: "", releaseDate: "", title: "", voteAverage: 9.0)], totalPages: 1, totalResults: 10)
    }
    
    func getPopularMovies(request: MovieRequest) async throws -> PopularMovies {
        
        return PopularMovies(page: 1, results: [Movie(adult: true, id: 1, originalLanguage: "", originalTitle: "", overview: "", popularity: 5.0, posterPath: "", releaseDate: "", title: "", voteAverage: 9.0)], totalPages: 1, totalResults: 10)
    }
    
    func getTopRatedMovies(request: MovieRequest) async throws -> PopularMovies {
        return PopularMovies(page: 1,
                             results: [
                                Movie(adult: true, id: 1, originalLanguage: "", originalTitle: "", overview: "", popularity: 5.0, posterPath: "", releaseDate: "", title: "", voteAverage: 9.0),
                                Movie(adult: true, id: 1, originalLanguage: "", originalTitle: "", overview: "", popularity: 5.0, posterPath: "", releaseDate: "", title: "", voteAverage: 9.0)],
                             totalPages: 1,
                             totalResults: 10)
    }
    
    
}
