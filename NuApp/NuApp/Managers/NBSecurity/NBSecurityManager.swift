//
//  NBSecurityManager.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 19/03/25.
//

import Foundation

public protocol NBSecurityManagerProtocol {
    var isJailbroken: Bool { get }
}

final class NBSecurityManager: NBSecurityManagerProtocol {
    
    private let fileManager: NBFileManagerProtocol
    private var checks: [NBSecurityCheck]
    
    var isJailbroken: Bool { !jailbreakIndicators.isEmpty }
    
    lazy var jailbreakIndicators: [NBSecurityCheck] = {
        let failedChecks = checks.filter { $0.isCompromised() }
        failedChecks.forEach { print($0.description) }
        return failedChecks
    }()
    
    // MARK: - Initialization
    
    init(fileManager: NBFileManagerProtocol) {
        self.fileManager = fileManager
        self.checks = [
            SuspiciousAppCheck(fileManager: fileManager),
            SuspiciousSystemFileCheck(fileManager: fileManager),
            SuspiciousProcessGroupCheck(),
            SuspiciousDynamicLibraryCheck(),
            FridaEnvironmentVariableCheck(),
            WritableSystemFileCheck(fileManager: fileManager)
        ]
    }
}
