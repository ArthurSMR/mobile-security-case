//
//  NBSecurity.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 22/03/25.
//

import Foundation

public final class NBSecurity {
    
    public static func makeNBSecurityManager(fileManager: FileManager = .default) -> NBSecurityManagerProtocol {
        let nbFileManager: NBFileManagerProtocol = NBFileManager(fileManager: fileManager)
        let checks = NBSecurityCheckFactory.makeSecurityChecks(fileManager: nbFileManager)
        let securityManager = NBSecurityManager(checks: checks)
        return securityManager
    }
}
