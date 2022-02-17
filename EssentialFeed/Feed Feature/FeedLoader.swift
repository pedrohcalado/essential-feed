//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by PEDRO HENRIQUE CALADO on 2/17/22.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func load (completion: @escaping (LoadFeedResult) -> Void)
}
