//
//  FeedPresenter.swift
//  EssentialFeediOS
//
//  Created by Pedro Henrique Calado on 05/01/23.
//

import Foundation
import EssentialFeed

protocol FeedLoadingView: AnyObject {
  func display(_ viewModel: FeedLoadingViewModel)
}

protocol FeedView {
  func display(_ viewModel: FeedViewModel)
}

final class FeedPresenter {
  var feedView: FeedView
  var loadingView: FeedLoadingView
  
  init(feedView: FeedView, loadingView: FeedLoadingView) {
    self.feedView = feedView
    self.loadingView = loadingView
  }
  
  func didStartLoadingFeed() {
    loadingView.display(FeedLoadingViewModel(isLoading: true))
  }
  
  func didFinishLoadingFeed(with feed: [FeedImage]) {
    feedView.display(FeedViewModel(feed: feed))
    loadingView.display(FeedLoadingViewModel(isLoading: false))
  }
  
  func didFinishLoadingFeed(with error: Error) {
    loadingView.display(FeedLoadingViewModel(isLoading: false))
  }
}
