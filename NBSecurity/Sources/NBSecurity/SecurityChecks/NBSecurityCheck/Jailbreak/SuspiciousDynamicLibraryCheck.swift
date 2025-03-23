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
    
    var type: NBSecurityCheckType { .jailbreak }
    var description: String { return "Suspicious dynamic library" }
    
    func isCompromised() -> Bool {
        isSuspiciousDynamicLibrary()
    }
    
    /// Checks if any suspicious dynamic libraries are loaded into the process.
    ///
    /// This method iterates through the list of dynamically linked libraries loaded at runtime
    /// and checks if any of them match a predefined set of suspicious libraries.
    ///
    /// - Returns: `true` if a suspicious library is detected, otherwise `false`.
    private func isSuspiciousDynamicLibrary() -> Bool {
        let suspiciousLibraries = Set(Constants.suspiciousLibraries.map { $0.lowercased() })
        
        // Get the total number of loaded dynamic libraries
        let libraryCount = _dyld_image_count()
        
        for index in 0..<libraryCount {
            
            // Retrieve the name (path) of the dynamic library at the current index.
            guard let imageName = _dyld_get_image_name(index) else {
                continue
            }
            
            // Convert the library name to a string and make it lowercase.
            let libraryName = String(cString: imageName).lowercased()
            
            if suspiciousLibraries.contains(libraryName) {
                return true
            }
        }
        return false
    }
}
