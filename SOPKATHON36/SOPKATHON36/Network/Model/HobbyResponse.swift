//
//  HobbyResponse.swift
//  SOPKATHON36
//
//  Created by 이은지 on 5/18/25.
//

import Foundation

struct HobbyContentResponse: Decodable {
    let contents: [Content]
}

extension HobbyContentResponse {
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

extension HobbyContentResponse {
    func toEntity() -> [HobbyModel] {
        return contents.map {
            .init(
                placeImage: $0.image,
                placeName: $0.location,
                placeDetail: $0.description
            )
        }
    }
}
