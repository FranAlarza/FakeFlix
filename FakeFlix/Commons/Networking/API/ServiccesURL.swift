//
//  ServiccesURL.swift
//  FakeFlix
//
//  Created by Francisco Javier Alarza Sanchez on 15/5/23.
//

import Foundation

enum ServiccesURL: String {
    
    case baseURL = "https://api.themoviedb.org"
    
    var convertedURL: URL {
        guard let url = URL(string: rawValue) else {
            assertionFailure("Incorrect format of URL")
            return URL(string: "")!
        }
        
        return url
    }
}
