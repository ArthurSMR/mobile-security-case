//
//  NBSecurity.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 22/03/25.
//

import Foundation

public final class NBSecurity {
    
    /// This method creates and returns an instance of `NBSecurityManager`, responsible for performing security checks on your app.
    ///
    /// The `NBSecurityManager` provides methods to check your app's security, including checks for jailbreak, debugging, and simulator usage.
    ///
    /// - Returns: An instance conforming to `NBSecurityManagerProtocol`, which provides methods to check the security status of the app.
    ///
    /// - Example:
    /// ```swift
    /// let securityManager = NBSecurity.makeNBSecurityManager()
    /// if securityManager.isJailbroken {
    ///     print("The app is running on a jailbroken device.")
    /// }
    /// ```
    public static func makeNBSecurityManager() -> NBSecurityManagerProtocol {
        let nbFileManager: NBFileManagerProtocol = NBFileManager(fileManager: .default)
        let checks = NBSecurityCheckFactory.makeSecurityChecks(fileManager: nbFileManager)
        let securityManager = NBSecurityManager(checks: checks)
        return securityManager
    }
}
