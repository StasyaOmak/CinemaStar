// UIStackView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для более удобного добавление subviews к stackView
///  Плюс отключение translatesAutoresizingMaskIntoConstraints
public extension UIStackView {
    /// метод добавляет subviews ко стеквью, и отключает для них translatesAutoresizingMaskIntoConstraints
    /// - Parameter  views: массив добавляемых вью
    /// - Parameter  needToPrepare: булевое значение для выбора отключить или нет
    /// translatesAutoresizingMaskIntoConstraints
    func addArrangedSubviews(_ views: [UIView], prepareForAutolayout needToPrepare: Bool = true) {
        views.forEach { addArrangedSubview(needToPrepare ? prepareForAutoLayout($0) : $0) }
    }
}
