//
//  SuspiciousDynamicLibraryCheck.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 22/03/25.
//

import MachO
import Foundation

final class SuspiciousDynamicLibraryCheck: NBSecurityCheck {
    private let suspiciousLibraries = Set(Constants.suspiciousLibraries.map { $0.lowercased() })
    
    var description: String { return "Suspicious dynamic library" }
    
    func isCompromised() -> Bool {
        isSuspiciousDynamicLibrary()
    }
    
    private func isSuspiciousDynamicLibrary() -> Bool {
        let suspiciousLibraries = Set(Constants.suspiciousLibraries.map { $0.lowercased() })
        let libraryCount = _dyld_image_count()
        
        for index in 0..<libraryCount {
            guard let imageName = _dyld_get_image_name(index) else {
                continue
            }
            
            let libraryName = String(cString: imageName).lowercased()
            
            if suspiciousLibraries.contains(libraryName) {
                return true
            }
        }
        return false
    }
}
