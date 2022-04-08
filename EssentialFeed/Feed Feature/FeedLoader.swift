//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by PEDRO HENRIQUE CALADO on 2/17/22.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}

protocol FeedLoader {
    func load (completion: @escaping (LoadFeedResult) -> Void)
}
