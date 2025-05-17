//
//  CardEntity.swift
//  SOPKATHON36
//
//  Created by 최주리 on 5/18/25.
//

import Foundation

struct CardEntity {
    let name: String
    let location: String
    let distance: String
    let age: String
    let hobby: String
    let information: String
}

extension CardEntity {
    static func mock() -> CardEntity {
        .init(
            name: "익명의 미자",
            location: "경상북도 구미시",
            distance: "3.4km",
            age: "56세",
            hobby: "등산",
            information: "저는 다정하고 따뜻한 어쩌구에요"
        )
    }
}
