//
//  RegisterRequest.swift
//  SOPKATHON36
//
//  Created by 최주리 on 5/18/25.
//

import Foundation

struct RegisterRequest: Encodable {
    let nickname: String
    let profile_image: String
    let description: String
    let age: Int
    let phone_number: String
    let gender: String
    let area_id: Int
    let hobby: String
    let same_gender_only: Bool
    let profile_open: Bool
}
