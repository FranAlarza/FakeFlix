//
//  ButtonSelector.swift
//  FakeFlix
//
//  Created by Francisco Javier Alarza on 20/7/23.
//

import Foundation
import SwiftUI

struct ButtonSelector: ViewModifier {
    var isSelected: Bool
    
    func body(content: Content) -> some View {
        content
            .frame(height: 24)
            .foregroundColor(isSelected ? Color.white : Color.gray)
            .font(.caption)
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(isSelected ? Color.activeButtonColor : Color.disabledButtonColor)
            )
    }
}

struct ButtonTypeMovieSelector: ViewModifier {
    
    var isSelected: Bool
    
    func body(content: Content) -> some View {
        content
            .padding()
            .modifier(ButtonSelector(isSelected: isSelected))
    }
}
