//
//  NBSecurityManager.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 19/03/25.
//

import Foundation

protocol NBSecurityManagerProtocol {
    func isJailbroken() -> Bool
}

final class NBSecurityManager: NBSecurityManagerProtocol {
    private let fileManager: NBFileManagerProtocol
    
    init(fileManager: NBFileManagerProtocol) {
        self.fileManager = fileManager
    }
    
    func isJailbroken() -> Bool {
        isSuspiciousAppInstalled() ||
        isSuspiciousSystemFilePresent() ||
        isSuspiciousProcessGroup() ||
        isSuspiciousDynamimcLibrary() ||
        isFridaEnvironmentVariablePresent()
    }
    
    private func isSuspiciousAppInstalled() -> Bool {
        let suspiciousAppsPaths: [String] = Constants.suspiciousAppsPaths
        
        for path in suspiciousAppsPaths {
            if fileManager.fileExists(atPath: path) {
                return true
            }
        }
        return false
    }
    
    private func isSuspiciousSystemFilePresent() -> Bool {
        let suspiciousSystemFilePaths: [String] = Constants.suspiciousSystemFilePaths
        
        for path in suspiciousSystemFilePaths {
            if fileManager.fileExists(atPath: path) {
                return true
            }
        }
        return false
    }
    
    private func isSuspiciousProcessGroup() -> Bool {
        let pid = getpgrp()
        return pid < 0
    }
}

// TODO: - Decouple ddld
import MachO
extension NBSecurityManager {
    
    private func isSuspiciousDynamimcLibrary() -> Bool {
        let suspiciousLibraries = Set(Constants.suspiciousLibraries.map { $0.lowercased() })
        let libraryCount = _dyld_image_count()
        
        for index in 0..<libraryCount {
            guard let imageName = _dyld_get_image_name(index) else {
                continue
            }
            
            let libraryName = String(cString: imageName).lowercased()
            
            if suspiciousLibraries.contains(libraryName) {
                return true
            }
        }
        return false
    }
    
    private func isFridaEnvironmentVariablePresent() -> Bool {
        let environmentVariables = ["FRIDA", "FRIDA_SERVER"]
        let environment = ProcessInfo.processInfo.environment
        for variable in environmentVariables {
            if environment[variable] != nil {
                return true
            }
        }
        return false
    }
}
