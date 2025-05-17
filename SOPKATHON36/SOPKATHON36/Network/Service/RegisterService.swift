//
//  RegisterService.swift
//  SOPKATHON36
//
//  Created by 최주리 on 5/18/25.
//

protocol RegisterService {
    func register(
        nickname: String,
        description: String,
        age: Int,
        phone_number: String,
        gender: String,
        hobby: String,
        sameGender: Bool
    ) async throws -> Int
}

final class DefaultRegisterService: RegisterService {
    private let network = BaseService.shared
    
    func register(
        nickname: String,
        description: String,
        age: Int,
        phone_number: String,
        gender: String,
        hobby: String,
        sameGender: Bool
    ) async throws -> Int {
        let request: RegisterRequest = .init(
            nickname: nickname,
            profile_image: "",
            description: "설명",
            age: age,
            phone_number: "010-1234-1234",
            gender: "MALE",
            area_id: 1,
            hobby: "등산",
            same_gender_only: false,
            profile_open: true
        )
        
        do {
            let response: RegisterResponse = try await network.request(endPoint: .register, body: request)
            return response.profile_id
        } catch {
            print(error.localizedDescription)
            return 0
        }
    }
    
    
}
