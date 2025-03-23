//
//  NBSecurityManagerProtocol.swift
//  NBSecurity
//
//  Created by Arthur Rodrigues on 23/03/25.
//

import Foundation

/// A protocol that defines security-related checks for the application.
/// Implementations of this protocol provide methods to verify whether the app is running in a secure environment.
public protocol NBSecurityManagerProtocol {
    
    /// Indicates whether the application is running in a secure environment.
    ///
    /// This property returns `true` if none of the security threats (jailbreak, simulator, or debugging) are detected.
    var isSecure: Bool { get }
    
    /// Indicates whether the device is jailbroken.
    ///
    /// This property returns `true` if the system detects signs of a jailbreak, such as unauthorized file system access or suspicious processes.
    var isJailbroken: Bool { get }
    
    /// Indicates whether the application is running on a simulator.
    ///
    /// This property returns `true` if the app is being executed in an iOS simulator instead of a physical device.
    var isSimulator: Bool { get }
    
    /// Indicates whether the application is being debugged.
    ///
    /// This property returns `true` if the app is running under a debugger, which can be a security risk in certain scenarios.
    var isDebugging: Bool { get }
}
