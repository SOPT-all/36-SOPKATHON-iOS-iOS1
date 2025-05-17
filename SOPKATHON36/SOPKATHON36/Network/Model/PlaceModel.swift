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
            PlaceModel(placeImage: "1", placeName: "", placeDetail: ""),
            PlaceModel(placeImage: "1", placeName: "", placeDetail: ""),
            PlaceModel(placeImage: "1", placeName: "", placeDetail: ""),
            PlaceModel(placeImage: "1", placeName: "", placeDetail: ""),
            PlaceModel(placeImage: "1", placeName: "", placeDetail: ""),
        ]
    }
}
