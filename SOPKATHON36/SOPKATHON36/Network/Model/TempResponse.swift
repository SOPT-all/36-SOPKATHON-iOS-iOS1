//
//  TempResponse.swift
//  SOPKATHON36
//
//  Created by 최주리 on 5/16/25.
//

import Foundation

struct TempModelRequest: Encodable {
    let id: Int
}

struct TempModelResponse: Decodable {
    let name: String
}
