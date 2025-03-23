//
//  SuspiciousSystemFileCheck.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 22/03/25.
//

import Foundation

final class SuspiciousSystemFileCheck: NBSecurityCheck {
    var type: NBSecurityCheckType { .jailbreak }
    private let fileManager: NBFileManagerProtocol
    
    var description: String { "Suspicious system file detected" }
    
    init(fileManager: NBFileManagerProtocol) {
        self.fileManager = fileManager
    }
    
    func isCompromised() -> Bool {
        isSuspiciousSystemFile()
    }
    
    /// Checks if any suspicious system files exist on the device.
    ///
    /// This method checks a predefined list of suspicious file paths in the system, which may indicate the presence
    /// of unauthorized modifications or potential tampering of system files. If any of the files are found, it is
    /// considered a security risk.
    ///
    /// - Returns: `true` if any suspicious system file exists; `false` otherwise.
    private func isSuspiciousSystemFile() -> Bool {
        let suspiciousSystemFilePaths: [String] = Constants.suspiciousSystemFilePaths
        
        for path in suspiciousSystemFilePaths {
            if fileManager.fileExists(atPath: path) {
                return true
            }
        }
        return false
    }
}
