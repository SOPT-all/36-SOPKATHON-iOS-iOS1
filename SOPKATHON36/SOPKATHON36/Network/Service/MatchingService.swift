//
//  MatchingService.swift
//  SOPKATHON36
//
//  Created by 최주리 on 5/18/25.
//

protocol MatchingServiceProtocol {
    func matching(id: Int) async throws -> String
}

final class DefaultMatchingService: MatchingServiceProtocol {
    let network = BaseService.shared
    
    func matching(id: Int) async throws -> String {
        do {
            let response: MatchingResponse = try await network.request(endPoint: .matching(id))
            return response.phone_number
        } catch {
            print(error.localizedDescription)
            return "010-1234-5678"
        }
    }
}

final class MockMatchingService: MatchingServiceProtocol {
    func matching(id: Int) async throws -> String {
        return "010-1234-5678"
    }
}
