//
//  RecommendResponse.swift
//  SOPKATHON36
//
//  Created by 최주리 on 5/18/25.
//

import Foundation

struct RecommendResponse: Decodable {
    let profile_id: Int
    let profile_image: String
    let nickname: String
    let area: String
    let distance: Float
    let age: Int
    let hobby: String
    let description: String
}

extension RecommendResponse {
    func toEntity() -> RecommendUserEntity {
        return .init(
            id: self.profile_id,
            name: self.nickname,
            location: self.area,
            distance: self.distance,
            age: self.age,
            hobby: self.hobby,
            information: self.description
        )
    }
}
