//
//  DetailViewModelTests.swift
//  FakeFlixTests
//
//  Created by Francisco Javier Alarza Sanchez on 16/5/23.
//

import XCTest
@testable import FakeFlix

final class DetailViewModelTests: XCTestCase {

    var sut: DetailViewModel!
    var repository: AppRepositoryFake!
    
    override func setUp() {
        sut = DetailViewModel()
        repository = AppRepositoryFake()
    }
    
    override func tearDown() {
        sut = nil
        repository.moviesToLoad.removeAll()
    }

    func testSaveFavoritesSuccess() {
        // Given
        sut = DetailViewModel(repository: repository)
        let movie = Movie(adult: true, id: 12, originalLanguage: "", originalTitle: "", overview: "", popularity: 1.0, posterPath: "", releaseDate: "", title: "", voteAverage: 5.0)
        // When
        sut.saveFavorite(movie: movie)
        let movies = repository.load(forKey: StorageKeys.KEY_FAVORITES, as: [Movie].self)
        // Then
        XCTAssertEqual(movies?.count, 1)
    }
    
    func testLoadFavoritesSuccess() {
        // Given
        sut = DetailViewModel(repository: repository)
        let movie = Movie(adult: true, id: 12, originalLanguage: "", originalTitle: "", overview: "", popularity: 1.0, posterPath: "", releaseDate: "", title: "", voteAverage: 5.0)
        // When
        sut.saveFavorite(movie: movie)
        sut.loadFavorites()
        // Then
        XCTAssertEqual(sut.movies.first?.id, 12)
    }
    
    func testCheckIfIsFavoriteSuccess() {
        // Given
        sut = DetailViewModel(repository: repository)
        let movie = Movie(adult: true, id: 12, originalLanguage: "", originalTitle: "", overview: "", popularity: 1.0, posterPath: "", releaseDate: "", title: "", voteAverage: 5.0)
        // When
        sut.saveFavorite(movie: movie)
        sut.loadFavorites()
        let isFavorite = sut.checkIfIsFavorite(movie: movie)
        // Then
        XCTAssertEqual(isFavorite, true)
    }
}
