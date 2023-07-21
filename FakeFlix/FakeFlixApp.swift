//
//  FakeFlixApp.swift
//  FakeFlix
//
//  Created by Francisco Javier Alarza Sanchez on 15/5/23.
//

import SwiftUI

@main
struct FakeFlixApp: App {
    @State private var isAppLoaded = false
    
    var body: some Scene {
        WindowGroup {
            if isAppLoaded {
                ContentView()
            } else {
                SplashScreen()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                            InfoManager.shared.playSound(sound: "intro", type: "mp3")
                            withAnimation {
                                self.isAppLoaded = true
                            }
                        }
                    }
            }
        }
    }
}
