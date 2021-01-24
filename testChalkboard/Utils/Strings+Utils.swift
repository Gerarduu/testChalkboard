//
//  Strings+Utils.swift
//  testChalkboard
//
//  Created by Gerard Riera  on 24/01/2021.
//

import Foundation

extension String {
    var localized: String {
        let auxString = (self as NSString).replacingOccurrences(of: "\0", with: "")
        return NSLocalizedString(auxString, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
