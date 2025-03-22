//
//  WritableSystemFileCheck.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 22/03/25.
//

import Foundation

final class WritableSystemFileCheck: NBSecurityCheck {
    private let fileManager: NBFileManagerProtocol
    
    var description: String { "Writable system file detected" }
    
    init(fileManager: NBFileManagerProtocol) {
        self.fileManager = fileManager
    }
    
    func isCompromised() -> Bool {
        canWriteIntoSystemFile()
    }
    
    private func canWriteIntoSystemFile() -> Bool {
        guard let textData = "Test for Jailbreak".data(using: .utf8) else { return false }
        let filePath = "/private/jailbreakTestText.txt"
        
        if fileManager.createFile(atPath: filePath, contents: textData) {
            return fileManager.removeItem(atPath: filePath)
        }
        return false
    }
}
