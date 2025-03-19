//
//  AppCoordinator.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 19/03/25.
//

import SwiftUI

protocol AppCoordinatorProtocol {
    func start() -> AnyView
}

final class AppCoordinator: AppCoordinatorProtocol {
    
    func start() -> AnyView {
        let securityManager: SecurityManagerProtocol = SecurityManager()
        let appState = AppStateViewModel(securityManager: securityManager)
        return AnyView(SplashScreen(appState: appState))
    }
}
