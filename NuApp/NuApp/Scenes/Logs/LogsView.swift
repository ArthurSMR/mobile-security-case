//
//  LogsView.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 22/03/25.
//

import SwiftUI

struct LogsView: View {
    @StateObject private var viewModel = LogsViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Carregando logs...")
                        .padding()
                } else if viewModel.logs.isEmpty && !viewModel.isLoading {
                    Text("Não existem logs disponíveis")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding()
                } else {
                    List(viewModel.logs) { log in
                        VStack(alignment: .leading) {
                            Text(log.message)
                                .font(.headline)
                            Text(log.timestamp)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .navigationTitle("Logs")
            .onAppear {
                viewModel.fetchLogs()
            }
        }
    }
}
