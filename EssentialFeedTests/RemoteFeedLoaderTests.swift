//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by PEDRO HENRIQUE CALADO on 2/21/22.
//

import XCTest

class RemoteFeedLoader {
    
}

class HTTPClient {
    var requestedURL: URL?
}

class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }

}
