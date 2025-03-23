//
//  SuspiciousProcessGroupCheck.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 22/03/25.
//

import Foundation

final class SuspiciousProcessGroupCheck: NBSecurityCheck {
    var type: NBSecurityCheckType { .jailbreak }
    var description: String { "Suspicious process group" }
    
    func isCompromised() -> Bool {
        isSuspiciousProcessGroup()
    }
    
    /// Checks if the current process belongs to a suspicious process group.
    ///
    /// Normally, legitimate processes belong to a valid process group with a non-negative ID (`>= 0`).
    /// This function retrieves the process group ID using `getpgrp()`. If it returns a negative value,
    /// it may indicate that the process is running in an unusual or manipulated environment,
    /// such as under debugging or unauthorized modifications.
    ///
    /// - Returns: `true` if the process group ID is negative, indicating a potential security risk; otherwise, `false`.
    private func isSuspiciousProcessGroup() -> Bool {
        // Get the process group ID of the current process.
        let pid = getpgrp()
        
        // If the process group ID is negative, it may indicate an anomaly.
        return pid < 0
    }
}
