//
//  NBSecurityCheckFactory.swift
//  NBSecurity
//
//  Created by Arthur Rodrigues on 23/03/25.
//

import Foundation

final class NBSecurityCheckFactory {
    
    static func makeSecurityChecks(fileManager: NBFileManagerProtocol) -> [NBSecurityCheck] {
        var checks: [NBSecurityCheck] = []
        checks += makeJailBreakChecks(fileManager: fileManager)
        checks += makeAntiDebuggingChecks()
        checks += makeSimulatorCheck()
        return checks
    }
    
    private static func makeJailBreakChecks(fileManager: NBFileManagerProtocol) -> [NBSecurityCheck] {
        [
            SuspiciousAppCheck(fileManager: fileManager),
            SuspiciousSystemFileCheck(fileManager: fileManager),
            SuspiciousProcessGroupCheck(),
            SuspiciousDynamicLibraryCheck(),
            FridaEnvironmentVariableCheck(),
            WritableSystemFileCheck(fileManager: fileManager),
        ]
    }
    
    private static func makeAntiDebuggingChecks() -> [NBSecurityCheck] {
        [
            AntiDebuggingCheck()
        ]
    }
    
    private static func makeSimulatorCheck() -> [NBSecurityCheck] {
        [
            SimulatorCheck()
        ]
    }
}
