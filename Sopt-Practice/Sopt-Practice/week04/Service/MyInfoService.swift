//
//  MyInfoService.swift
//  Sopt-Practice
//
//  Created by 성환 on 5/6/26.
//

import Foundation

final class MyInfoService {
    static var shared = MyInfoService()
    private init() {}
    
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
        
        request.httpMethod = "GET"
        
        let header = ["Content-Type" : "application/json"]
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
    
    func getMyInfo() async throws -> UserDataDTO {
        let request = try makeRequest(body: nil)
        
        let (data, resposne) = try await URLSession.shared.data(for: request)
        dump("Request \(request)")
        guard let httpResponse = resposne as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        dump("Response \(resposne)")
        guard(200...299).contains(httpResponse.statusCode) else {
            throw configureHTTPError(errorCode: httpResponse.statusCode)
        }
        
        guard let decoded = try? JSONDecoder().decode(MyInfoResponseDTO.self, from: data),
              let userData = decoded.data else {
            throw NetworkError.responseDecodingError
        }
        return userData
    }
    
    private func configureHTTPError(errorCode: Int) -> Error {
        return NetworkError(rawValue: errorCode) ?? NetworkError.unknownError
    }
}
