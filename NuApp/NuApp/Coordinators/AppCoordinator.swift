//
//  AppCoordinator.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 19/03/25.
//

import SwiftUI
import NBSecurity

protocol AppCoordinatorProtocol {
    func start() -> AnyView
}

final class AppCoordinator: AppCoordinatorProtocol {
    
    func start() -> AnyView {
        let securityManager = NBSecurity.makeNBSecurityManager()
        let splashViewModel = SplashViewModel(securityManager: securityManager)
        let splashScreen = SplashScreen(viewModel: splashViewModel)
        return AnyView(splashScreen)
    }
}
