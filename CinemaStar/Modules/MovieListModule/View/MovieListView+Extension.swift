// MovieListView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// расширение MovieListViewController
extension MovieListViewController {
    func makeLabelWithAttributedText(
        regularText: String,
        boldText: String
    ) -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0

        let regularAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 20),
            .foregroundColor: UIColor.black
        ]

        let boldAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 20),
            .foregroundColor: UIColor.black
        ]

        let regularText = NSAttributedString(
            string: regularText,
            attributes: regularAttributes
        )
        let boldText = NSAttributedString(
            string: boldText,
            attributes: boldAttributes
        )

        let combinedText = NSMutableAttributedString()
        combinedText.append(regularText)
        combinedText.append(boldText)

        label.attributedText = combinedText

        return label
    }
}
