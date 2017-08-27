//
//  APIError.swift
//  APIClient
//
//  Created by mkns on 2017/08/27.
//  Copyright © 2017年 smakino. All rights reserved.
//

import Foundation

enum APIError: Error {
    case invalidParameter
    case invalidURL
    case invalidResponseJson
    case error(Error?)
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .invalidParameter:
            return "invalid parameter"
        case .invalidURL:
            return "invalid url"
        case .invalidResponseJson:
            return "invalid response json"
        case.error(let e):
            return e?.localizedDescription
        }
    }
}
