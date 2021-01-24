//
//  Birthdays.swift
//  testChalkboard
//
//  Created by Gerard Riera  on 24/01/2021.
//

import Foundation

struct BirthdaysRoot: Codable {
    
    var results: [Birthday]?
}

struct Birthday: Codable {
    var name: [Name]?
    var dob: [Dob]?
}

struct Name: Codable {
    var title: String?
    var first: String?
    var last: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case first = "first"
        case last = "last"
    }
}

struct Dob: Codable {
    var date: String?
    var age: String?
    
    enum CodingKeys: String, CodingKey {
        case date = "date"
        case age = "dob"
    }
}
