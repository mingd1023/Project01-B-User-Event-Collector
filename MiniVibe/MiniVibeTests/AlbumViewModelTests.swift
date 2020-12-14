//
//  AlbumViewModelTests.swift
//  MiniVibeTests
//
//  Created by TTOzzi on 2020/12/14.
//

import XCTest
import Combine
@testable import MiniVibe

final class AlbumViewModelTests: XCTestCase {
    
    private let useCase = MockAlbumUseCase(album: Album(id: 0,
                                                        title: "test",
                                                        description: "test",
                                                        releaseDate: "test",
                                                        artist: .init(id: 0, name: "test"),
                                                        imageUrl: "test",
                                                        tracks: []))
    private var cancellables: Set<AnyCancellable> = []
    
    func test_send_appear() {
        let expectation = XCTestExpectation(description: "appear test")
        defer { wait(for: [expectation], timeout: 5) }
        
        let viewModel = AlbumViewModel(id: 0,
                                       useCase: useCase,
                                       eventLogger: MockEventLogger())
        
        viewModel.$state
            .sink { state in
                if state.album == self.useCase.album {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.send(.appear)
    }
    
    func test_send_showAlbumMenu() {
        let expectation = XCTestExpectation(description: "showAlbumMenu test")
        defer { wait(for: [expectation], timeout: 5) }
        
        let viewModel = AlbumViewModel(id: 0,
                                       useCase: useCase,
                                       eventLogger: MockEventLogger())
        
        viewModel.$state
            .sink { state in
                if state.showSheet,
                   state.activeSheet == .album {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.send(.showAlbumMenu)
    }
    
    func test_send_showTrackMenu() {
        let expectation = XCTestExpectation(description: "showTrackMenu test")
        defer { wait(for: [expectation], timeout: 5) }
        
        let viewModel = AlbumViewModel(id: 0,
                                       useCase: useCase,
                                       eventLogger: MockEventLogger())
        let trackViewModel = TrackViewModel(track: .init(id: 0,
                                                         title: "test",
                                                         lyrics: "test",
                                                         albumId: 0,
                                                         album: .init(id: 0, title: "test", imageUrl: "test"),
                                                         artist: .init(id: 0, name: "test"),
                                                         liked: 0))
        
        viewModel.$state
            .sink { state in
                if state.showSheet,
                   state.activeSheet == .track(info: trackViewModel) {
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.send(.showTrackMenu(info: trackViewModel))
    }
    
    func test_send_like() {
        let expectation = XCTestExpectation(description: "showTrackMenu test")
        defer { wait(for: [expectation], timeout: 5) }
        
        let eventLogger = MockEventLogger(handler: { data in
            XCTAssertEqual(data.event, "LikeLog")
            expectation.fulfill()
        })
        
        let viewModel = AlbumViewModel(id: 0,
                                       useCase: useCase,
                                       eventLogger: eventLogger)
        
        viewModel.send(.like)
    }
}
