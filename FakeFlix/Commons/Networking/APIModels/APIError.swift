//
//  APIError.swift
//  FakeFlix
//
//  Created by Francisco Javier Alarza Sanchez on 15/5/23.
//

import Foundation

struct APIError: Error, Codable {
    let success: Bool?
    let code: Int?
    let message: String?
    
    enum CodingKeys: String, CodingKey {
        case success
        case code = "status_code"
        case message = "status_message"
    }
}
