//
//  FeedImageDataLoader.swift
//  EssentialFeediOS
//
//  Created by Pedro Henrique Calado on 26/11/22.
//

import Foundation

public protocol FeedImageDataLoaderTask {
    func cancel()
}

public protocol FeedImageDataLoader {
    typealias Result = Swift.Result<Data, Error>
    func loadImageData(from url: URL, completion: @escaping (Result) -> Void) -> FeedImageDataLoaderTask
}
