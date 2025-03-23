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
