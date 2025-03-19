//
//  SecurityManagerProtocol.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 19/03/25.
//

import Foundation

protocol SecurityManagerProtocol {
    func isJailbreak() -> Bool
}

final class SecurityManager: SecurityManagerProtocol {
    func isJailbreak() -> Bool {
        let isJailbreak = Bool.random()
        return isJailbreak
    }
}
