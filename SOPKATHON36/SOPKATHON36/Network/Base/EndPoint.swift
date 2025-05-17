//
//  EndPoint.swift
//  SOPKATHON36
//
//  Created by 최주리 on 5/17/25.
//

import Foundation

enum EndPoint {
    case register // 프로필 등록
    case recommend // 취미 맞는 친구 랜덤 추천
    case matching(Int) // 매칭 수락
    case fetchContents // 취미 맞는 콘텐츠 목록 조회
    
    var restType: HTTPMethodType {
        switch self {
        case .register, .matching:
                .post
        case .recommend, .fetchContents:
                .get
        }
    }
    
    var url: String {
        switch self {
        case .register:
            "/api/v1/profile"
        case .recommend:
            "/api/v1/profile/recommend"
        case .matching(let id):
            "api/v1/matching/\(id)"
        case .fetchContents:
            "api/v1/contents?hobby=등산"
        }
    }
    
    var header: [String: String] {
        switch self {
        case .register:
            HeaderType.none.value
        case .recommend, .matching, .fetchContents:
            HeaderType.auth.value
        }
    }
}
