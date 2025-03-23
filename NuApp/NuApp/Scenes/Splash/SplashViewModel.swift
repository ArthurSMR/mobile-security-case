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
        case loaded
    }
    
    private let securityManager: NBSecurityManagerProtocol
    
    /// If you want to debug and see the logs, turn this bool to true.
    var isDebugSession: Bool = true
    
    init(state: State = .loading,
         securityManager: NBSecurityManagerProtocol) {
        self.securityManager = securityManager
    }
    
    // MARK: - Intents
    
    @MainActor
    func initializeApp() async {
        checkAppSecurity()
    }
    
    private func checkAppSecurity() {
        if !securityManager.isSecure {
            handleInsecureApp()
        }
    }
    
    private func handleInsecureApp() {
        if isDebugSession { return }
        exit(-1)
    }
}
