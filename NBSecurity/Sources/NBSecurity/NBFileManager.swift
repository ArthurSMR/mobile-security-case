//
//  FileManager.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 21/03/25.
//

import Foundation

protocol NBFileManagerProtocol {
    func fileExists(atPath path: String) -> Bool
    func createFile(atPath path: String, contents: Data) -> Bool
    func removeItem(atPath path: String) -> Bool
}

final class NBFileManager: NBFileManagerProtocol {
    
    private let fileManager: FileManager
    
    init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }
    
    func fileExists(atPath path: String) -> Bool {
        fileManager.fileExists(atPath: path)
    }
    
    func createFile(atPath path: String, contents: Data) -> Bool {
        fileManager.createFile(atPath: path, contents: contents)
    }
    
    func removeItem(atPath path: String) -> Bool {
        do {
            try fileManager.removeItem(atPath: path)
            return true
        } catch {
            return false
        }
    }
}
