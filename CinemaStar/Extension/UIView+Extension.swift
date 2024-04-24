// UIView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для более удобного добавление subviews к view
/// Отключение translatesAutoresizingMaskIntoConstraints
public extension UIView {
    /// метод добавляет subviews ко view, и отключает для них translatesAutoresizingMaskIntoConstraints
    /// - Parameter  views: массив добавляемых view
    /// - Parameter  needToPrepare: Bool значение для выбора отключения
    /// translatesAutoresizingMaskIntoConstraints

    func addSubviews(_ views: [UIView], prepareForAutolayout needToPrepare: Bool = true) {
        views.forEach { addSubview(needToPrepare ? prepareForAutoLayout($0) : $0) }
    }
}
