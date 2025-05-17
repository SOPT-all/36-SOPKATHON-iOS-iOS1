//
//  HobbyResponse.swift
//  SOPKATHON36
//
//  Created by 이은지 on 5/18/25.
//

import Foundation

struct HobbyResponse: Decodable {
    let statusCode: Int
    let message: String
    let data: ContentData

    enum CodingKeys: String, CodingKey {
        case statusCode = "status_code"
        case message
        case data
    }
}

extension HobbyResponse {
    struct ContentData: Decodable {
        let contents: [Content]
    }
}

extension HobbyResponse.ContentData {
    struct Content: Decodable {
        let contentID: Int
        let image: String
        let location: String
        let description: String

        enum CodingKeys: String, CodingKey {
            case contentID = "content_id"
            case image
            case location
            case description
        }
    }
}

extension HobbyResponse {
    func toEntity() -> [HobbyModel] {
        return data.contents.map {
            .init(
                placeImage: $0.image,
                placeName: $0.location,
                placeDetail: $0.description
            )
        }
    }
}
