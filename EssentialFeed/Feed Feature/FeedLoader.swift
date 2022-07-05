//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by PEDRO HENRIQUE CALADO on 2/17/22.
//

import Foundation

public typealias LoadFeedResult = Result<[FeedImage], Error>

public protocol FeedLoader {
    func load (completion: @escaping (LoadFeedResult) -> Void)
}
