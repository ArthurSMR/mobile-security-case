//
//  ContentView.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 19/03/25.
//

import SwiftUI

struct SplashScreen: View {
    @ObservedObject var viewModel: SplashViewModel
    @State private var showLogsModal = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Commons.Colors.purple.color
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("nu_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 160, height: 160, alignment: .center)
                    
                    Button(action: {
                        showLogsModal.toggle()
                    }) {
                        Text("Logs")
                            .foregroundColor(Commons.Colors.purple.color)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(8)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 16)
                }
            }
            .onAppear {
                Task {
                    await viewModel.initializeApp()
                }
            }
            .sheet(isPresented: $showLogsModal) {
                LogsView()
            }
        }
    }
}

