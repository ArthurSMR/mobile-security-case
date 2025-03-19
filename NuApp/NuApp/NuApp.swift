//
//  NuAppApp.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 19/03/25.
//

import SwiftUI

@main
struct NuApp: App {
    private let appCoordinator: AppCoordinatorProtocol = AppCoordinator()
    
    var body: some Scene {
        WindowGroup {
            appCoordinator.start()
        }
    }
}
