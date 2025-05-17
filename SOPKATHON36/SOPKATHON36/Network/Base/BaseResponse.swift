//
//  BaseResponse.swift
//  SOPKATHON36
//
//  Created by 최주리 on 5/17/25.
//

import Foundation

struct BaseResponse<T: Decodable>: Decodable {
    let success: Bool
    let code: Int
    let message: String
    let data: T?
}
