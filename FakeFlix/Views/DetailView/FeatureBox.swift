//
//  FeatureBox.swift
//  FakeFlix
//
//  Created by Francisco Javier Alarza on 19/7/23.
//

import Foundation
import SwiftUI

struct FeatureBox: View {
    let image: String
    let type: String
    let info: String
    
    var body: some View {
        VStack {
            Image(systemName: image)
                .foregroundColor(.white)
                .padding()
            Text(type)
                .foregroundColor(.white)
                .lineLimit(2)
                .font(.caption)
                .multilineTextAlignment(.center)
            Text(info)
                .foregroundColor(.white)
                .font(.caption)
                .multilineTextAlignment(.center)
                .bold()
        }
        .padding(8)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.darkBackgroundColor)
        .cornerRadius(16)
        .border(Color.white, width: 2)
        .cornerRadius(4)
    }
    
}

struct FeatureBox_Previews: PreviewProvider {
    static var previews: some View {
        FeatureBox(image: "camera.fill", type: "Genre genre gen", info: "Cartoon")
    }
}
