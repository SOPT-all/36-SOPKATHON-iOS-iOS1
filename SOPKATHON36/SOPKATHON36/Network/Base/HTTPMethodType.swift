//
//  HTTPMethodType.swift
//  SOPKATHON36
//
//  Created by 최주리 on 5/17/25.
//

import Foundation

enum HTTPMethodType {
    case get
    case post

    var key: String {
        switch self {
        case .get:
            "GET"
        case .post:
            "POST"
        }
    }
}

enum HeaderType {
    case auth
    case none

    var value: [String: String] {
        switch self {
        case .auth:
            [
                "Content-Type": "application/json",
                "profile_id": "1"
            ]
        case .none:
            ["Content-Type": "application/json"]
        }
    }
}
