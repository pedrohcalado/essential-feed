//
//  RemoteFeedItem.swift
//  EssentialFeed
//
//  Created by Pedro Henrique Calado on 15/06/22.
//

import Foundation

 struct RemoteFeedItem: Decodable {
     let id: UUID
     let description: String?
     let location: String?
     let image: URL
}
