//
//  FetchHobby.swift
//  SOPKATHON36
//
//  Created by 이은지 on 5/18/25.
//

import Foundation

protocol FetchHobby {
    func fetchHobby(data: String) async throws -> [HobbyModel]
}

final class DefaultFetchHobby: FetchHobby {
    private let network = BaseService.shared
    
    func fetchHobby(data: String) async throws -> [HobbyModel] {
        
        let response: HobbyContentResponse = try await network.request(endPoint: .fetchContents)

        return response.toEntity()
    }
}

final class MockFetchHobbyService: FetchHobby {
    func fetchHobby(data: String) async throws -> [HobbyModel] {
        return HobbyModel.dummy()
    }
}
