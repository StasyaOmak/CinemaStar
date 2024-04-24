// AppBuilder.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Контейнер для проставления зависимостей и сборки модулей
final class AppBuilder {
    // MARK: - Constants

    enum Constants {}

    // MARK: - Public Methodes

    func makeMovieListModule(coordinator: MovieListCoordinator) -> MovieListViewController {
        let viewModel = MovieListViewModel()
        let view = MovieListViewController(movieListViewModel: viewModel)
        return view
    }
}
