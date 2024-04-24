// AppCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор главный
final class AppCoordinator: BaseCoodinator {
    // MARK: - Private Properties

    private var appBuilder: AppBuilder

    init(appBuilder: AppBuilder) {
        self.appBuilder = appBuilder
    }

    // MARK: - Private Methods

    override func start() {
        goToMoviesList()
    }

    private func goToMoviesList() {
        let movieListCoordinator = MovieListCoordinator()
        let movieListModuleView = appBuilder.makeMovieListModule(
            coordinator: movieListCoordinator
        )
        movieListCoordinator.setViewController(controller: movieListModuleView)
        movieListCoordinator.onFinishFlow = { [weak self] in
            self?.remove(coordinator: movieListCoordinator)
            self?.goToMoviesDetail()
        }
        guard let movieListView = movieListCoordinator.rootController else { return }
        add(coordinator: movieListCoordinator)
        setAsRoot​(​_​: movieListView)
    }

    private func goToMoviesDetail() {}
}
