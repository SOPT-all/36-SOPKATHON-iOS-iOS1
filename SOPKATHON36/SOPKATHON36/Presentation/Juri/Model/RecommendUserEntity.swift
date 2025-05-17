//
//  RecommendUserEntity.swift
//  SOPKATHON36
//
//  Created by 최주리 on 5/18/25.
//

import Foundation

struct RecommendUserEntity {
    let id: Int
    let name: String
    let location: String
    let distance: Float
    let age: Int
    let hobby: String
    let information: String
}

extension RecommendUserEntity {
    static func mock() -> RecommendUserEntity {
        .init(
            id: 0,
            name: "익명의 미자",
            location: "경상북도 구미시",
            distance: 3.4,
            age: 56,
            hobby: "등산",
            information: "저는 다정하고 따뜻한 어쩌구에요"
        )
    }
}
