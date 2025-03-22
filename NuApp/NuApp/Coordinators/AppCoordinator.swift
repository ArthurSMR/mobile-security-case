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
        let fileManager = NBFileManager()
        let securityManager: NBSecurityManagerProtocol = NBSecurity.makeNBSecurityManager()
        let appStateViewModel = SplashViewModel(securityManager: securityManager)
        let splashScreen = SplashScreen(appState: appStateViewModel)
        return AnyView(splashScreen)
    }
}
