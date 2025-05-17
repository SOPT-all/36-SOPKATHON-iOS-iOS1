//
//  TempService.swift
//  SOPKATHON36
//
//  Created by 최주리 on 5/16/25.
//

import Foundation

protocol TempServiceProtocol {
    func getTest() async throws -> String
    func postTest(id: Int) async throws -> String
}

final class DefaultTempService: TempServiceProtocol {
    private let network = BaseService.shared

    func getTest() async throws -> String {
//        do {
//            let response: BaseResponse<TempModelResponse> = try await network.request(endPoint: .fetch)
//
//            guard let data = response.data else {
//                throw NetworkError.noData
//            }
//
//            return data.name
//        } catch {
//            // 에러일 때 행동 정의
//            print("get 실패 ~")
//            return ""
//        }
        return ""
    }

    func postTest(id: Int) async throws -> String {
//        do {
//            let request = TempModelRequest(id: id)
//            let response: BaseResponse<TempModelResponse> = try await network.request(
//                endPoint: .login,
//                body: request
//            )
//
//            guard let data = response.data else {
//                throw NetworkError.noData
//            }
//
//            return data.name
//        } catch {
//            // 에러일 때 행동 정의
//            print("post 실패 ~")
//            return ""
//        }
        return ""
    }
}
