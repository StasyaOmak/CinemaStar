// MovieDetailUITests.swift
// Copyright © RoadMap. All rights reserved.

import XCTest

final class MovieDetailUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        app = XCUIApplication()
        app.launch()
        continueAfterFailure = false
        sleep(2)
        let collectionView = app.collectionViews["moviesCollectionViewIdentifier"]
        XCTAssert(collectionView.exists)
        sleep(6)
        let cell = collectionView.cells.element(boundBy: 0)
        XCTAssert(cell.exists)
        cell.tap()
        sleep(1)
        let moviesDetailView = app.otherElements["movieDetailViewIdentifier"]
        XCTAssert(moviesDetailView.exists)
    }

    override func tearDownWithError() throws {
        app = nil
    }

    func testTapIsFavoriteButton() {
        let isFavoriteButton = app.buttons["isFavoriteButtonIdentifier"]
        XCTAssert(isFavoriteButton.exists)
        isFavoriteButton.tap()
        let backButton = app.buttons["backButtonIdentifier"]
        XCTAssert(backButton.exists)
        backButton.tap()
        let collectionView = app.collectionViews["moviesCollectionViewIdentifier"]
        XCTAssert(collectionView.exists)
        sleep(3)
        let cell = collectionView.cells.element(boundBy: 0)
        XCTAssert(cell.exists)
        cell.tap()
        sleep(1)
    }

    func testWatchMovieButton() {
        let watchMovieButton = app.buttons["watchMovieButtonIdentifier"]
        XCTAssert(watchMovieButton.exists)
        watchMovieButton.tap()
        let watchMovieAlert = app.alerts.firstMatch
        XCTAssert(watchMovieAlert.exists)
        let okButton = watchMovieAlert.buttons.element(boundBy: 0)
        okButton.tap()
    }

    func testSwipeTableView() {
        let tableView = app.tables["movieDetailTableViewIdentifier"]
        XCTAssert(tableView.exists)
        tableView.swipeUp()
        tableView.swipeDown()
    }

    func testSwipeActorsCollectionView() {
        let tableView = app.tables["movieDetailTableViewIdentifier"]
        XCTAssert(tableView.exists)
        let cell = tableView.cells.element(boundBy: 3)
        XCTAssert(cell.exists)
        sleep(5)

        let collectionView = cell.collectionViews["actorsCollectionViewIdentifier"]
        XCTAssert(collectionView.exists)
        collectionView.swipeLeft()
        collectionView.swipeRight()
    }
}
