//
//  ContentView.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 19/03/25.
//

import SwiftUI

struct SplashScreen: View {
    @ObservedObject var appState: SplashViewModel
    
    var body: some View {
        VStack {
            Image("nu_icon")
                .resizable()
                .scaledToFit()
                .frame(width: 160, height: 160, alignment: .center)
        }
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Commons.Colors.purple.color)
        .onAppear {
            Task {
                await appState.initializeApp()
            }
        }
    }
}
