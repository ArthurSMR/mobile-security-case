//
//  FridaEnvironmentVariableCheck.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 22/03/25.
//

import Foundation

final class FridaEnvironmentVariableCheck: NBSecurityCheck {
    var type: NBSecurityCheckType { .jailbreak }
    var description: String { "Frida environment variable found" }
    
    func isCompromised() -> Bool {
        isFridaEnvironmentVariablePresent()
    }
    
    /// Checks if the Frida environment variables are present.
    ///
    /// This method scans the process environment for known Frida-related variables.
    /// Frida is a dynamic instrumentation toolkit often used for reverse engineering.
    ///
    /// - Returns: `true` if any Frida-related environment variable is detected, otherwise `false`.
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
