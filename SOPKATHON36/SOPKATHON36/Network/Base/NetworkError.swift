//
//  NetworkError.swift
//  SOPKATHON36
//
//  Created by 최주리 on 5/17/25.
//



import Foundation

enum NetworkError: Error {
    case urlError
    case httpURLResponseError
    case responseDecodingError
    case noData
    case requestEncodingError
    case serverErrorMessage(String)
    case unknownError

    var errorDescription: String {
        switch self {
        case .urlError:
            "사용할 수 없는 URL"
        case .httpURLResponseError:
            "HTTPURLResponse로 타입 캐스팅 불가"
        case .responseDecodingError:
            "디코딩 실패"
        case .noData:
            "데이터 없음"
        case .requestEncodingError:
            "인코딩 실패"
        case .serverErrorMessage(let message):
            message
        case .unknownError:
            "알 수 없는 에러"
        }
    }
}