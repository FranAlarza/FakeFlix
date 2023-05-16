//
//  FavoritesViewModelTests.swift
//  FakeFlixTests
//
//  Created by Francisco Javier Alarza Sanchez on 16/5/23.
//

import XCTest
@testable import FakeFlix


final class FavoritesViewModelTests: XCTestCase {

    var sut: FavoritesViewModel!
    var repository: AppRepositoryFake!
    
    override func setUp() {
        sut = FavoritesViewModel()
        repository = AppRepositoryFake()
    }
    
    override func tearDown() {
        sut = nil
        repository = nil
    }
    
    func testGetFavoriteMovies() {
        // Given
        sut = FavoritesViewModel(repository: repository)
        // When
        sut.getFavoriteMovies()
        // Then
        XCTAssertTrue(sut.favoritesMovies.count == 3)
    }

}
