//
//  RecommendService.swift
//  SOPKATHON36
//
//  Created by 최주리 on 5/18/25.
//

protocol RecommendServiceProtocol {
    func fetchRecommendUser() async throws -> RecommendUserEntity
}

final class DefaultRecommendService: RecommendServiceProtocol {
    let network = BaseService.shared
    
    func fetchRecommendUser() async throws -> RecommendUserEntity {
        do {
            let response: BaseResponse<RecommendResponse> = try await network.request(endPoint: .recommend)
            
            guard let data = response.data else {
                throw NetworkError.noData
            }
            
            return data.toEntity()
        } catch {
            print("error")
            return .mock()
        }
    }
}

final class MockRecommendService: RecommendServiceProtocol {
    func fetchRecommendUser() async throws -> RecommendUserEntity {
        return .mock()
    }
}
