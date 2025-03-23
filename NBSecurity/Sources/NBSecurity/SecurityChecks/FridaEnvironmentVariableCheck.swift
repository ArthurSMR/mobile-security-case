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
