//
//  SplashScreen.swift
//  FakeFlix
//
//  Created by Francisco Javier Alarza on 20/7/23.
//

import SwiftUI

struct SplashScreen: View {
    var body: some View {
        VStack {
            Spacer()
            Image("f_letter")
                .resizable()
                .frame(width: 400, height: 200)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.darkBackgroundColor)
    }
}

struct SplashScreen_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreen()
    }
}
