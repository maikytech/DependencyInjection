//
//  DependencyInjectionTests.swift
//  DependencyInjectionTests
//
//  Created by Maiqui Cedeño on 22/03/22.
//

import XCTest
@testable import DependencyInjection

class DependencyInjectionTests: XCTestCase {
    private var viewModel: PostsViewModel!
    private var provider: PostProviderProtocol!

    override func setUpWithError() throws {
        provider = PostsProviderMock()
        viewModel = PostsViewModel(provider: provider)
        
    }
    
    override func tearDownWithError() throws {
        provider = nil
        viewModel = nil
    }

    func testgetUserFromProvider() throws {
        let expectation = expectation(description: "retriving data ...")
        viewModel.getUserFromProvider { postModelArray in
            postModelArray.forEach { object in
                print("title: ", object.title)
            }
            XCTAssertTrue(postModelArray.count > 0)
            expectation.fulfill()
        }
        waitForExpectations(timeout: 0.1)
    }
}
