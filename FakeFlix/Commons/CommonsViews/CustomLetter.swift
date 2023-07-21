//
//  CustomLetter.swift
//  FakeFlix
//
//  Created by Francisco Javier Alarza on 20/7/23.
//

import SwiftUI

struct CustomLetter: View {
    var body: some View {
        Image("f_letter")
                    .resizable()
                    .frame(width: 80, height: 40)
    }
}

struct CustomLetter_Previews: PreviewProvider {
    static var previews: some View {
        CustomLetter()
    }
}
