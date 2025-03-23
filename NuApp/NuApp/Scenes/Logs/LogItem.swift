//
//  LogItem.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 22/03/25.
//

import Foundation

struct LogItem: Identifiable {
    let id = UUID()
    var message: String
    var timestamp: String
}
