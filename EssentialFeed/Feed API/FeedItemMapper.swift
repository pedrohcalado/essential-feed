//
//  FeedItemMapper.swift
//  EssentialFeed
//
//  Created by PEDRO HENRIQUE CALADO on 4/1/22.
//

import Foundation

 final class FeedItemMapper {
    private struct Root: Decodable {
        let items: [RemoteFeedItem]
    }
    
    private static var OK_200: Int { return 200 }
    
     static func map(_ data: Data, from response: HTTPURLResponse) throws -> [RemoteFeedItem] {
        guard response.statusCode == OK_200, let root = try? JSONDecoder().decode(Root.self, from: data) else {
            throw RemoteFeedLoader.Error.invalidData
        }
    
        return root.items
    }
}
