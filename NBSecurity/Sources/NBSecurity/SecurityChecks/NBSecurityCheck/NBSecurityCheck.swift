//
//  NBSecurityCheck.swift
//  NuApp
//
//  Created by Arthur Rodrigues on 22/03/25.
//

import Foundation

enum NBSecurityCheckType {
    case jailbreak
    case simulator
    case debugging
}

protocol NBSecurityCheck {
    
    /// Security Type
    var type: NBSecurityCheckType { get }
    
    /// Description for the security check
    var description: String { get }
    
    /// This method will check the security
    /// - Returns: It will return true if is compromised or any other security issue.
    func isCompromised() -> Bool
}
