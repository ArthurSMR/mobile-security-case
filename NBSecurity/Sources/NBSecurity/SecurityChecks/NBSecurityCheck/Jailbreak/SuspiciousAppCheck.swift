//
//  SuspiciousAppCheck.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 22/03/25.
//

import Foundation

final class SuspiciousAppCheck: NBSecurityCheck {
    var type: NBSecurityCheckType { .jailbreak }
    
    private let fileManager: NBFileManagerProtocol
    var description: String { "Suspicious app installed" }
    
    init(fileManager: NBFileManagerProtocol) {
        self.fileManager = fileManager
    }
    
    func isCompromised() -> Bool {
        isSuspiciousAppInstalled()
    }
    
    /// Checks if any suspicious applications are installed on the device.
    ///
    /// This method verifies the presence of known suspicious apps by checking
    /// their installation paths. If any of these paths exist, it indicates
    /// a potential security risk.
    ///
    /// - Returns: `true` if a suspicious app is detected, otherwise `false`.
    private func isSuspiciousAppInstalled() -> Bool {
        let suspiciousAppsPaths: [String] = Constants.suspiciousAppsPaths
        
        for path in suspiciousAppsPaths {
            if fileManager.fileExists(atPath: path) {
                return true
            }
        }
        return false
    }
}
