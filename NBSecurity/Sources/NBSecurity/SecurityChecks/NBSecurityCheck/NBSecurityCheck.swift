//
//  NBSecurityCheck.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 22/03/25.
//

import Foundation

enum NBSecurityCheckType {
    case jailbreak
    case simulator
    case debugging
}

/// A protocol that defines a security check mechanism.
/// Implementations of this protocol perform specific security verifications within the application.
protocol NBSecurityCheck {
    
    /// The type of security check being performed.
    ///
    /// This property indicates whether the check is related to jailbreak detection, debugging, simulator detection, etc.
    var type: NBSecurityCheckType { get }
    
    /// A description of the security check.
    ///
    /// This property provides a human-readable explanation of what the security check does.
    var description: String { get }
    
    /// Executes the security check.
    ///
    /// - Returns: `true` if the security check detects a compromise or security issue, otherwise `false`.
    func isCompromised() -> Bool
}
