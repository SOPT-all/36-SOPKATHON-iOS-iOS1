//
//  BaseResponse.swift
//  SOPKATHON36
//
//  Created by 최주리 on 5/17/25.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    let status_code: Int
    let error_code: String?
    let message: String
    let data: T?
}
