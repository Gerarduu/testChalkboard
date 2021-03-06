//
//  AppError.swift
//  testChalkboard
//
//  Created by Gerard Riera  on 24/01/2021.
//

import Foundation

enum AppError: Error {
    case message(String)
    case generic
    case malformedData
    
    public var errorDescription: String? {
        switch self {
        case .message(let message): return message
        case .generic: return "Error"
        default: return ""
        }
    }
}
