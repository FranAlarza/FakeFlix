//
//  Double+Extensions.swift
//  FakeFlix
//
//  Created by Francisco Javier Alarza Sanchez on 16/5/23.
//

import Foundation

extension Double {
    var roundedToOneDecimal: String {
        return String(format: "%.1f", self)
    }
}
