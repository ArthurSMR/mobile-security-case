//
//  LogsViewModel.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 22/03/25.
//

import Foundation
import OSLog

final class LogsViewModel: ObservableObject {
    @Published var logs: [LogItem] = []
    @Published var isLoading: Bool = false
    
    private var subsystem: String { "NBSecurity" }
    private var category: String { "Security" }
    
    func fetchLogs() {
        isLoading = true
        
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let self = self else { return }
            
            do {
                let logStore = try OSLogStore(scope: .currentProcessIdentifier)
                let startTime = logStore.position(date: Date().addingTimeInterval(-30))
                let predicate = NSPredicate(format: "subsystem == %@ AND category == %@", subsystem, category)
                
                let logEntries = try logStore.getEntries(at: startTime, matching: predicate)
                    .compactMap { $0 as? OSLogEntryLog }
                    .map { LogItem(message: $0.composedMessage, timestamp: $0.date.description) }
                
                DispatchQueue.main.async {
                    self.logs = logEntries
                }
            } catch {
                print("Erro ao acessar os logs: \(error)")
            }
            
            DispatchQueue.main.async {
                self.isLoading = false
            }
        }
    }
}
