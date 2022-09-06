//
//  FeedViewControllerTests.swift
//  EssentialFeediOSTests
//
//  Created by Pedro Henrique Calado on 05/09/22.
//

import XCTest
import UIKit
import EssentialFeed

final class FeedViewController: UITableViewController {
    private var loader: FeedLoader?
    
    convenience init(loader: FeedLoader) {
        self.init()
        self.loader = loader
    }
    
    override func viewDidLoad() {
        loader?.load { _ in }
        
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(load), for: .valueChanged)
    }
    
    @objc private func load() {
        loader?.load { _ in }
    }
}

class FeedViewControllerTests: XCTestCase {

    func test_init_doesNotLoadFeed() {
        let (_, loader) = makeSUT()
        
        XCTAssertEqual(loader.loaderCallCount, 0)
    }
    
    func test_viewDidLoad_loadsFeed() {
        let (sut, loader) = makeSUT()
        
        sut.loadViewIfNeeded()
        
        XCTAssertEqual(loader.loaderCallCount, 1)
    }
    
    func test_pullToRefresh_loadsFeed() {
        let (sut, loader) = makeSUT()
        
        sut.refreshControl?.siulatePullToRefresh()
        
        XCTAssertEqual(loader.loaderCallCount, 2)
        
        sut.refreshControl?.siulatePullToRefresh()
        
        XCTAssertEqual(loader.loaderCallCount, 3)
    }
    
    // MARK: - Helpers
    
    private func makeSUT(file: StaticString = #file, line: UInt = #line) -> (sut: FeedViewController, loader: LoaderSpy) {
            let loader = LoaderSpy()
            let sut = FeedViewController(loader: loader)
            trackForMemoryLeaks(instance: loader, file: file, line: line)
            trackForMemoryLeaks(instance:sut, file: file, line: line)
            return (sut, loader)
        }
    
    class LoaderSpy: FeedLoader {
        private(set) var loaderCallCount: Int = 0
        
        func load(completion: @escaping (FeedLoader.Result) -> Void) {
            loaderCallCount += 1
        }

    }
}

private extension UIRefreshControl {
    func siulatePullToRefresh() {
        allTargets.forEach({ target in
            actions(forTarget: target, forControlEvent: .valueChanged)?.forEach({
                (target as NSObject).perform(Selector($0))
            })
        })
    }
}
