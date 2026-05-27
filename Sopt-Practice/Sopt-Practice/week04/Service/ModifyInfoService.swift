//
//  ModifyInfoService.swift
//  Sopt-Practice
//
//  Created by 성환 on 5/6/26.
//

import Foundation

final class ModifyInfoService {
    static var shared = ModifyInfoService()
    private init() {}
    
    private func makeRequestBody(name: String?, email: String?, age: Int?) -> Data? {
        do {
            let data = ModifyInfoRequestDTO(name: name, email: email, age: age)
            let jsonEncoder = JSONEncoder()
            let requestBody = try jsonEncoder.encode(data)
            return requestBody
        } catch {
            print(error)
            return nil
        }
    }
    
    private func makeRequest(body: Data?) throws -> URLRequest {
        guard let baseURL = Bundle.main.infoDictionary?["BASE_URL"] as? String else {
            throw NetworkError.urlError
        }
        
        guard let userId = UserManager.shared.userId else {
            throw UserError.userIdNotFound
        }
        
        let baseUrl = baseURL
        let path = "api/v1/users/\(userId)"
        let url = baseUrl + path
        
        guard let encodeurl = URL(string: url) else {
            throw NetworkError.urlError
        }
        
        var request = URLRequest(url: encodeurl)
        
        request.httpMethod = "PATCH"
        
        let header = ["Content-Type": "application/json"]
        header.forEach {
            request.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        
        if let body = body {
            request.httpBody = body
        }
        
        if let body = request.httpBody, let str = String(data: body, encoding: .utf8) {
            print("Request Body: \(str)")
        }
        
        return request
    }
    
    func patchMyInfo(name: String?, email: String?, age: Int?) async throws -> MyInfoResponseDTO {
        guard let body = makeRequestBody(name: name, email: email, age: age) else {
            throw NetworkError.requestEncodingError
        }
        
        let request = try makeRequest(body: body)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        dump("Request \(request)")
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        dump("Response \(response)")
        
        guard(200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }
        
        do {
            let decoded = try JSONDecoder().decode(MyInfoResponseDTO.self, from: data)
            return decoded
        } catch {
            throw error
        }
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
}
