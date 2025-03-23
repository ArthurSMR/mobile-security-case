//
//  NBSecurityManager.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 19/03/25.
//

import Foundation
import OSLog

final class NBSecurityManager: NBSecurityManagerProtocol {
    
    var isSecure: Bool {
        let jailbreakSafe = !isJailbroken
        let simulatorSafe = !isSimulator
        let debuggingSafe = !isDebugging
        return jailbreakSafe && simulatorSafe && debuggingSafe
    }
    
    private var checks: [NBSecurityCheck]
    
    var isJailbroken: Bool {
        return hasCompromisedCheck(ofType: .jailbreak)
    }
    
    var isSimulator: Bool {
        return hasCompromisedCheck(ofType: .simulator)
    }
    
    var isDebugging: Bool {
        return hasCompromisedCheck(ofType: .debugging)
    }
    
    // MARK: - Initialization
    
    init(checks: [NBSecurityCheck]) {
        self.checks = checks
    }
    
    private func hasCompromisedCheck(ofType type: NBSecurityCheckType) -> Bool {
        let failedChecks = checks.filter { $0.type == type && $0.isCompromised() }
        
        if !failedChecks.isEmpty {
            let logger = Logger(subsystem: "NBSecurity", category: "Security")
            failedChecks.forEach { logger.log("[NBSecurity] - \($0.description)") }
            return true
        }
        
        return false
    }
}
