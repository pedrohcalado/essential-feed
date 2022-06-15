//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Pedro Henrique Calado on 15/06/22.
//

import Foundation

internal struct RemoteFeedItem: Decodable {
    internal let id: UUID
    internal let description: String?
    internal let location: String?
    internal let image: URL
}
