//
//  NetworkError.swift
//  MovieList
//
//  Created by Vivek Sehrawat on 22/09/23.
//

import Foundation

enum NetworkError: Error {
    case invalidRequest
    case badRequest
    case failed
    case noData
    case noResponse
    case unableToDecode(Error)
    
    var description: String {
        
        switch self {
        case .invalidRequest: return "Invalid Request"
        case .badRequest: return "Bad Request"
        case .failed: return "Network Request Failed"
        case .noData: return "Response returned with no data"
        case .noResponse: return "Response returned with no response"
        case let .unableToDecode(error): return "Response couldnot be decoded \(error)"
        }
    }
}
