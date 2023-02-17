//
//  FeedImageViewModel.swift
//  EssentialFeediOS
//
//  Created by Pedro Henrique Calado on 07/12/22.
//

import Foundation
import EssentialFeed

struct FeedImageViewModel<Image> {
    let description: String?
    let location: String?
    let image: Image?
    let isLoading: Bool
    let shouldRetry: Bool

    var hasLocation: Bool {
        return location != nil
    }
}
