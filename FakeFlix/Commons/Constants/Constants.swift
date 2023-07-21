//
//  Constants.swift
//  FakeFlix
//
//  Created by Francisco Javier Alarza Sanchez on 15/5/23.
//

import Foundation

enum ConstantKeys: String {
    case apikey
}

struct Constants {
    static let API_KEY: String = InfoManager.shared.get(for: ConstantKeys.apikey.rawValue, in: .apiConfig) ?? ""
}
