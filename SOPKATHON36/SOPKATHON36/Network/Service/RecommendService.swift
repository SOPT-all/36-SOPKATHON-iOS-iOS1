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
            let response: RecommendResponse = try await network.request(endPoint: .recommend)
            
            return response.toEntity()
        } catch {
            print("\(error.localizedDescription)")
            return .mock()
        }
    }
}

final class MockRecommendService: RecommendServiceProtocol {
    func fetchRecommendUser() async throws -> RecommendUserEntity {
        return .mock()
    }
}
