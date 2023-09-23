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
    
    func testMovieService_Success()  async throws{
        //Arrange
        let expectation = expectation(description: "Movie Service on Success")
        mockNetworkManager.response = MockData.movieResponse
        // Act
        do {
            let expectedMovies = try await movieService.fetchMoviesFromNetwork()
            if expectedMovies.count > 0 {
                expectation.fulfill()
            }
        } catch {
            XCTFail("Failure not expected")
        }
        await waitForExpectations(timeout: 3)
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
        let expectation = expectation(description: "Movie Count to be 20")
        mockNetworkManager.response = MockData.movieResponse
        
        // Act
        do {
            let expectedMovies = try await movieService.fetchMoviesFromNetwork()
            if expectedMovies.count == 20 {
                expectation.fulfill()
            }
        } catch {
            XCTFail("Failure not expected")
        }
        
        // Assert
        await waitForExpectations(timeout: 3)
    }
    
}
