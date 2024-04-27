// MoviesListUITests.swift
// Copyright © RoadMap. All rights reserved.

import XCTest

final class CinemaStarProjectTemplateUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testSwipeCollectionView() {
        let collectionView = app.collectionViews["moviesCollectionViewIdentifier"]
        XCTAssert(collectionView.exists)
        collectionView.swipeUp()
        collectionView.swipeDown()
    }

    func testMoveToDetailScreen() {
        let collectionView = app.collectionViews["moviesCollectionViewIdentifier"]
        XCTAssert(collectionView.exists)
        let cell = collectionView.cells.element(boundBy: 0)
        XCTAssert(cell.exists)
        cell.tap()
        sleep(1)

        let moviesDetailView = app.otherElements["movieDetailViewIdentifier"]
        XCTAssert(moviesDetailView.exists)

        // to do
        // добавить тест на кнопку возвращения на экран фильмов
    }
}
