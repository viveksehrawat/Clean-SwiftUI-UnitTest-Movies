//
//  URLRequestGeneratorTests.swift
//  MovieListTests
//
//  Created by Vivek Sehrawat on 23/09/23.
//

import XCTest
@testable import Movies

final class URLRequestGeneratorTests: XCTestCase {

    var requestGenerator: IURLRequestGenerator!
    
    override func setUpWithError() throws {
        super.setUp()
        requestGenerator = URLRequestGenerator()
    }

    override func tearDown()  {
        requestGenerator = nil
        super.tearDown()
    }

    func testURLResquest(){
        let request = NetworkRequest(path: "/3/movie/now_playing", method: .get, headerParamaters: ["Content-Type":"application/json"])
        do {
            let urlRequest = try requestGenerator.createURLRequest(using: request)
            XCTAssertEqual(urlRequest.url?.host, "api.themoviedb.org")
            XCTAssertEqual(urlRequest.url?.scheme, "https")
            XCTAssertEqual(urlRequest.url?.path, "/3/movie/now_playing")
            XCTAssertEqual(urlRequest.url, URL(string: "https://api.themoviedb.org/3/movie/now_playing?"))
            XCTAssertEqual(urlRequest.httpMethod, HTTPMethod.get.rawValue)
            XCTAssertEqual(urlRequest.allHTTPHeaderFields, ["Content-Type":"application/json"])
            XCTAssertNil(urlRequest.httpBody)
        } catch{
            XCTFail("Request Failure not expected")
        }
    }
    
    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
