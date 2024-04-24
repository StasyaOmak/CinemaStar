// MovieListCoordinator.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Координатор для экрана списка фильмов
final class MovieListCoordinator: BaseCoodinator {
    // MARK: - Public Properties

    var rootController: UINavigationController?
    var onFinishFlow: VoidHandler?

    // MARK: - Public Methods

    func setViewController(controller: UIViewController) {
        rootController = UINavigationController(rootViewController: controller)
    }
}
