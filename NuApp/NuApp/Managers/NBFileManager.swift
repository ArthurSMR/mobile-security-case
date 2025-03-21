//
//  FileManager.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 21/03/25.
//

import Foundation

protocol NBFileManagerProtocol {
    func fileExists(atPath path: String) -> Bool
}

final class NBFileManager: NBFileManagerProtocol {
    private let fileManager: FileManager
    
    init(fileManager: FileManager = .default) {
        self.fileManager = fileManager
    }
    
    func fileExists(atPath path: String) -> Bool {
        return fileManager.fileExists(atPath: path)
    }
}
