//
//  AntiDebuggingCheck.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 22/03/25.
//

import Foundation

final class AntiDebuggingCheck: NBSecurityCheck {
    var description: String { "Anti-Debugging detected" }
    
    func isCompromised() -> Bool {
        isDebuggerAttached()
    }
    
    private func isDebuggerAttached() -> Bool {
        var info = kinfo_proc()
        var size = MemoryLayout<kinfo_proc>.stride
        let mib = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
        
        let result = sysctl(UnsafeMutablePointer(mutating: mib), u_int(mib.count), &info, &size, nil, 0)
        
        guard result == 0 else { return false }
        
        // Verifica a flag P_TRACED
        return (info.kp_proc.p_flag & P_TRACED) != 0
    }
}
