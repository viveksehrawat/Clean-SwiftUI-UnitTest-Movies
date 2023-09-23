//
//  MockNetworkManager.swift
//  MoviesTests
//
//  Created by Vivek Sehrawat on 23/09/23.
//

import Foundation
@testable import Movies

class MockNetworkManager: INetworkManager {
    
    var response: Decodable?
    var error: Error?
    
    func request<T: Decodable>(request: INetworkRequest, responseType: T.Type) async throws -> T where T : Decodable {
        
        if let error = error {
            throw error
        }

        if let response = response {
            return response as! T
        } else {
            throw NetworkError.invalidResponse
        }
    }
}
