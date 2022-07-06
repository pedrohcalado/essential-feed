//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by PEDRO HENRIQUE CALADO on 2/17/22.
//

import Foundation

public protocol FeedLoader {
    typealias Result = Swift.Result<[FeedImage], Error>
    func load (completion: @escaping (Result) -> Void)
}
