//
//  PlaceModel.swift
//  SOPKATHON36
//
//  Created by 이은지 on 5/18/25.
//

import UIKit

struct PlaceModel {
    let placeImage: String
    let placeName: String
    let placeDetail: String
}

extension PlaceModel {
    static func dummy() -> [PlaceModel] {
        return [
            PlaceModel(placeImage: "https://example.com/mountain-image.jpg", placeName: "경상북도 청송시", placeDetail: "주왕산으로 유명한 청송시는 국립공원과 절경 맛집으로 유명해요"),
            PlaceModel(placeImage: "https://example.com/mountain-image.jpg", placeName: "경상북도 문경시", placeDetail: "문경새재랑 함께 언급되는 주흘산! 오늘은 주흘산에 도전해볼까요?"),
            PlaceModel(placeImage: "https://example.com/mountain-image.jpg", placeName: "경상북도 청송시", placeDetail: "주왕산으로 유명한 청송시는 국립공원과 절경 맛집으로 유명해요"),
            PlaceModel(placeImage: "https://example.com/mountain-image.jpg", placeName: "경상북도 문경시", placeDetail: "문경새재랑 함께 언급되는 주흘산! 오늘은 주흘산에 도전해볼까요?"),
            PlaceModel(placeImage: "https://example.com/mountain-image.jpg", placeName: "경상북도 청송시", placeDetail: "주왕산으로 유명한 청송시는 국립공원과 절경 맛집으로 유명해요"),
        ]
    }
}
