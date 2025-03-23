//
//  WritableSystemFileCheck.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 22/03/25.
//

import Foundation

final class WritableSystemFileCheck: NBSecurityCheck {
    var type: NBSecurityCheckType { .jailbreak }
    private let fileManager: NBFileManagerProtocol
    
    var description: String { "Writable system file detected" }
    
    init(fileManager: NBFileManagerProtocol) {
        self.fileManager = fileManager
    }
    
    func isCompromised() -> Bool {
        canWriteIntoSystemFile()
    }
    
    /// Checks if the app has write access to system files.
    ///
    /// This method attempts to write a test file to a protected system location (`/private/`), which should normally
    /// be restricted for writing on non-jailbroken devices. If the app is able to write to this location and then remove
    /// the file, it indicates that the system may be compromised (e.g., jailbroken).
    ///
    /// - Returns: `true` if the app is able to write to the system file; `false` otherwise.
    private func canWriteIntoSystemFile() -> Bool {
        guard let textData = "Test for Jailbreak".data(using: .utf8) else { return false }
        let filePath = "/private/jailbreakTestText.txt"
        
        if fileManager.createFile(atPath: filePath, contents: textData) {
            return fileManager.removeItem(atPath: filePath)
        }
        return false
    }
}
