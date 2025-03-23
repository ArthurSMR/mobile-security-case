//
//  AppStateViewModel.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 19/03/25.
//

import SwiftUI
import NBSecurity

final class SplashViewModel: ObservableObject {
    private let securityManager: NBSecurityManagerProtocol
    @Published var showIsSecureAlert = false
    
    /// If you want to debug and see the logs, turn this bool to true.
    var isDebugSession: Bool = true
    
    
    
    init(securityManager: NBSecurityManagerProtocol) {
        self.securityManager = securityManager
    }
    
    // MARK: - Intents
    
    @MainActor
    func initializeApp() async {
        checkAppSecurity()
    }
    
    private func checkAppSecurity() {
        if securityManager.isSecure {
            handleIsSecureApp()
        } else {
            handleInsecureApp()
        }
    }
    
    private func handleIsSecureApp() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.showIsSecureAlert = true
        }
    }
    
    private func handleInsecureApp() {
        if isDebugSession { return }
        exit(-1)
    }
}
