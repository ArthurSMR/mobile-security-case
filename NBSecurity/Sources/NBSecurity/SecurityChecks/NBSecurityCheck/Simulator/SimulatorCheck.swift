//
//  SimulatorCheck.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 23/03/25.
//

import Foundation

final class SimulatorCheck: NBSecurityCheck {
    var type: NBSecurityCheckType { .simulator }
    var description: String { "Simulator execution detected" }
    
    /// Checks if the app is running on a simulator at runtime.
    ///
    /// This property examines the process environment variables to determine
    /// if the app is executing within an iOS simulator.
    ///
    /// - Returns: `true` if the app is running on a simulator, otherwise `false`.
    var isRunningOnSimulator: Bool {
        ProcessInfo().environment["SIMULATOR_DEVICE_NAME"] != nil
    }
    
    /// Checks if the app is being compiled for a simulator.
    ///
    /// This property uses a compile-time directive to check whether the code
    /// is being built specifically for a simulator environment.
    ///
    /// - Returns: `true` if the app is compiled for a simulator, otherwise `false`.
    var isCompilingOnSimulator: Bool {
#if targetEnvironment(simulator)
        return true
#else
        return false
#endif
    }
    
    func isCompromised() -> Bool {
        isRunningOnSimulator || isCompilingOnSimulator
    }
}
