//
//  NBSecurity.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 22/03/25.
//

import Foundation

public final class NBSecurity {
    
    static func makeNBSecurityManager(fileManager: FileManager = .default) -> NBSecurityManagerProtocol {
        let nbFileManager = NBFileManager(fileManager: fileManager)
        let securityManager = NBSecurityManager(fileManager: nbFileManager)
        return securityManager
    }
}
