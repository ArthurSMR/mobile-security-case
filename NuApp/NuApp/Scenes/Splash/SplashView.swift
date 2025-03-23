//
//  SplashView.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 19/03/25.
//

import SwiftUI

struct SplashView: View {
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
                }
            }
            .toolbar {
                if viewModel.isDebugSession {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showLogsModal.toggle()
                        }) {
                            Image(systemName: "info.circle")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                    }
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
