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
    
    var isRunningOnSimulator: Bool {
        ProcessInfo().environment["SIMULATOR_DEVICE_NAME"] != nil
    }
    
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
