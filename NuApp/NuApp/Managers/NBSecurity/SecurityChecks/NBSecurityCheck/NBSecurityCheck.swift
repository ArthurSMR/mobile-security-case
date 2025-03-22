//
//  NBSecurityCheck.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 22/03/25.
//

import Foundation

protocol NBSecurityCheck {
    var description: String { get }
    func isCompromised() -> Bool
}
