//
//  APIPath.swift
//  FakeFlix
//
//  Created by Francisco Javier Alarza Sanchez on 15/5/23.
//

import Foundation

enum APIPath {
    case popularMovies
    case topRatedMovies
    case movies(id: String)
    
    var rawValue: String {
        switch self {
        case .popularMovies: return "/3/movie/popular"
        case .topRatedMovies: return "/3/movie/top_rated"
        case let .movies(id): return "/3/movie/\(id)"
        }
    }
}
