//
//  APIRouter.swift
//  testChalkboard
//
//  Created by Gerard Riera  on 24/01/2021.
//

import Foundation

enum APIRouter {
    
    /// Birthdays
    case birthdays

    var method: String {
        switch self {
            case .birthdays : return kHTTPMethodGet
        }
    }

    var queryItems: [URLQueryItem] {
        switch self {
        case .birthdays:
            
            let parameters = [
                URLQueryItem(name: kResults, value: kResultsVal),
                URLQueryItem(name: kSeed, value: kSeedVal),
                URLQueryItem(name: kInc, value: kIncVal),
            ]
            return parameters
        }
    }

    static let baseURLString = kBaseURL

    var path: String {
        switch self {
            case .birthdays: return kApiPath
        }
    }

    var headers: [String: String]? {
        var headers: [String: String] = [:]
        if let curLanguage = Bundle.main.preferredLocalizations.first {
            switch curLanguage {
            case "es":
                headers["Accept-Language"] = "es"
            case "ca":
                headers["Accept-Language"] = "ca"
            default:
                headers["Accept-Language"] = "en"
            }
        }
        else {
            headers["Accept-Language"] = "en"
        }
        return headers
    }

    func asURLRequest() -> URLRequest? {
        var components = URLComponents(string: APIRouter.baseURLString+path)
        components?.queryItems = queryItems
        
        guard let url = components?.url else {return nil}
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        urlRequest.allHTTPHeaderFields = headers
        
        return urlRequest
    }
}

