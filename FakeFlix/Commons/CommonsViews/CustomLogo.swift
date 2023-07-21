//
//  CustomLogo.swift
//  FakeFlix
//
//  Created by Francisco Javier Alarza on 20/7/23.
//

import SwiftUI

struct CustomLogo: View {
    var body: some View {
        Image("F_logo")
            .resizable()
            .frame(width: 32, height: 32)
    }
}

struct CustomLogo_Previews: PreviewProvider {
    static var previews: some View {
        CustomLogo()
    }
}
