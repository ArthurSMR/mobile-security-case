//
//  AppStateViewModel.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 19/03/25.
//

import SwiftUI

final class AppStateViewModel: ObservableObject {
    
    enum State: String {
        case loading
        case insecure
        case unauthenticated
        case authenticated
    }
    
    @Published var state: State = .loading
    
    private let securityManager: SecurityManagerProtocol
    
    init(state: State = .loading,
         securityManager: SecurityManagerProtocol) {
        self.state = state
        self.securityManager = securityManager
    }
    
    // MARK: - Intents
    
    @MainActor
    func initializeApp() async {
        state = .loading
        
        if securityManager.isJailbreak() {
            state = .insecure
        }
    }
}
