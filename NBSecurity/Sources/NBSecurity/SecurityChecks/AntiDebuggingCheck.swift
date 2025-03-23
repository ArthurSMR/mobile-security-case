//
//  AntiDebuggingCheck.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 22/03/25.
//

import Foundation

final class AntiDebuggingCheck: NBSecurityCheck {
    var description: String { "Debugging detected" }
    
    func isCompromised() -> Bool {
        isDebuggerAttached()
    }
    
    // http://developer.apple.com/library/archive/qa/qa1361/_index.html
    private func isDebuggerAttached() -> Bool {
        var info = kinfo_proc()
        var size = MemoryLayout<kinfo_proc>.stride
        
        // Management Information Base - Check kernel
        // CTL_KERN -> Accessing kernel informations
        // KERN_PROC -> Details about the proccess
        // KERN_PROC_PID -> Specifying PID
        // getpid() -> PID for current process
        var mib = [CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()]
        
        // sysctl -> Check for kernel informations
        let result = sysctl(&mib, u_int(mib.count), &info, &size, nil, 0)
        
        // If sysctl was succeeded
        guard result == 0 else { return false }
        
        // Check a flag P_TRACED
        return (info.kp_proc.p_flag & P_TRACED) != 0
    }
}
