//
//  MovieServiceTests.swift
//  MoviesTests
//
//  Created by Vivek Sehrawat on 23/09/23.
//


import XCTest
@testable import Movies

class MovieServiceTests: XCTestCase{
    var movieService: IMovieService!
    var mockNetworkManager: MockNetworkManager!
    
    override func setUp() {
        super.setUp()
        mockNetworkManager = MockNetworkManager()
        movieService = MovieServiceImpl(networkManager: mockNetworkManager)
    }
    
    override func tearDown(){
        movieService = nil
        mockNetworkManager = nil
        super.tearDown()
    }
    
    func testMovieService_Stub_Success_MovieCount()  async throws{
        //Arrange
        let happyNetworkManager = HappyNetworkManagerStub()
        movieService = MovieServiceImpl(networkManager: happyNetworkManager)
        // Act
            let expectedMovies = try await movieService.fetchMoviesFromNetwork()
        // Assert
        XCTAssertEqual(expectedMovies.count, 20)
    }
    
    func test_attempt_is_only_called_once()  async throws{
        //Arrange
        let happyNetworkManager = HappyNetworkManagerStub()
        movieService = MovieServiceImpl(networkManager: happyNetworkManager)
        // Act
            let expectedMovies = try await movieService.fetchMoviesFromNetwork()
        // Assert
        XCTAssertEqual(expectedMovies.count, 20)
    }
    
    func testMovieService_Mock_Success_MovieCount()  async throws{
        //Arrange
        let happyNetworkManager = MockHappyNetworkManager()
        happyNetworkManager.response = MockData.movieResponse
        movieService = MovieServiceImpl(networkManager: happyNetworkManager)
        // Act
         _ =  try await movieService.fetchMoviesFromNetwork()
        // Assert
        XCTAssertEqual(happyNetworkManager.serviceCalled, 1)
    }
    
    func testMovieService_Failure() async throws {
        let expectation = expectation(description: "Movie Service on Failure Case")
        mockNetworkManager.error = NSError(domain: "FailedError", code: 0)
        do {
            _ = try await movieService.fetchMoviesFromNetwork()
            XCTFail("Success not expected")
        } catch {
            expectation.fulfill()
        }
        await waitForExpectations(timeout: 3)
    }
    
    func testMovieService_MovieCount() async throws {
        // Arrange
        mockNetworkManager.response = MockData.movieResponse
        // Act
        do {
            let expectedMovies = try await movieService.fetchMoviesFromNetwork()
            // Assert
            XCTAssertEqual(expectedMovies.count, 20)
        } catch {
            XCTFail("Failure not expected")
        }
    }
}

// Mark: - Stubs
class HappyNetworkManagerStub: INetworkManager {
    func request<T: Decodable>(request: INetworkRequest, responseType: T.Type) async throws -> T where T : Decodable {
        return MockData.movieResponse as! T
    }
}

class SadNetworkManagerStub: INetworkManager {
        func request<T: Decodable>(request: INetworkRequest, responseType: T.Type) async throws -> T where T : Decodable {
            throw NetworkError.invalidResponse
    }
}


// Mark: - Mock
class MockHappyNetworkManager: INetworkManager {
    var response: Decodable?
    var error: Error?
    var serviceCalled: Int = 0
    
    func request<T: Decodable>(request: INetworkRequest, responseType: T.Type) async throws -> T where T : Decodable {

        serviceCalled += 1
        if let response = response {
            return response as! T
        } else {
            throw NetworkError.invalidResponse
        }
    }
}
