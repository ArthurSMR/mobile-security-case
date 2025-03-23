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
    
    private func isSuspiciousProcessGroup() -> Bool {
        let pid = getpgrp()
        return pid < 0
    }
}
