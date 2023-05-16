//
//  HomeViewModelTests.swift
//  FakeFlixTests
//
//  Created by Francisco Javier Alarza Sanchez on 15/5/23.
//

import XCTest
@testable import FakeFlix

final class HomeViewModelTests: XCTestCase {

    var sut: HomeViewModel!
    var service: MovieServiceMock!
    var repository: AppRepositoryFake!
    
    override func setUp() {
        sut = HomeViewModel()
        service = MovieServiceMock()
        repository = AppRepositoryFake()
    }
    
    override func tearDown() {
        sut = nil
        service = nil
        repository = nil
    }
    
    func testGetMovies() async {
        // Given
        sut = HomeViewModel(service: service, repository: repository)
        
        // When
        await sut.getMovies()
        // Then
        XCTAssertFalse(sut.popularMovies?.results?.isEmpty ?? false)
    }
   

}
