//
//  AppStateViewModel.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 19/03/25.
//

import SwiftUI
import NBSecurity

final class SplashViewModel: ObservableObject {
    
    enum State: String {
        case loading
        case insecure
        case unauthenticated
        case authenticated
    }
    
    @Published var state: State = .loading
    
    private let securityManager: NBSecurityManagerProtocol
    
    init(state: State = .loading,
         securityManager: NBSecurityManagerProtocol) {
        self.state = state
        self.securityManager = securityManager
    }
    
    // MARK: - Intents
    
    @MainActor
    func initializeApp() async {
        state = .loading
        if securityManager.isJailbroken {
            state = .insecure
        }
    }
}
