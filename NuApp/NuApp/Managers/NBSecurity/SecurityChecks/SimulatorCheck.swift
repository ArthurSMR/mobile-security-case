//
//  SimulatorCheck.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 23/03/25.
//

import Foundation

final class SimulatorCheck: NBSecurityCheck {
    var description: String { "Simulator execution detected" }
    
    var isRunningOnSimulator: Bool {
        ProcessInfo().environment["SIMULATOR_DEVICE_NAME"] != nil
    }
    
    func isCompromised() -> Bool {
        isRunningOnSimulator
    }
}
