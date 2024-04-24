// MovieListCollectionViewCell.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Переиспользуемая ячейка для показа списка фильмов
final class MovieListCollectionViewCell: UICollectionViewCell {
    // MARK: - Constants

    private enum Constants {
        enum Insets {
            static let CornerRadius: CGFloat = 8
            static let imageHeight: CGFloat = 200
            static let inset: CGFloat = 8
        }

        enum Texts {
            static let starLabel = "⭐"
        }
    }

    // MARK: - Visual Components

    private lazy var movieImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = Constants.Insets.CornerRadius
        imageView.layer.masksToBounds = true
        return imageView
    }()

    lazy var movieInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually

        stackView.addArrangedSubviews([
            movieNameLabel,
            movieRatingStackView
        ])
        return stackView
    }()

    lazy var movieRatingStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 5

        stackView.addArrangedSubviews([
            starLabel,
            ratingLabel
        ])
        return stackView
    }()

    private let movieNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16)
        return label
    }()

    private let starLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.Texts.starLabel
        label.backgroundColor = .clear
        return label
    }()

    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16)
        label.backgroundColor = .clear
        return label
    }()

    // MARK: - Public Properties

    let identifier = "moviesListCollectionViewCell"

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        configureLayout()
        setupContentView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        contentView.addSubviews([
            movieImageView,
            movieInfoStackView
        ])
    }

    private func configureLayout() {
        configureMovieImageViewConstraints()
        configureMovieInfoStackViewConstraints()
        configureStarLabelConstraints()
    }

    private func setupContentView() {
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = Constants.Insets.CornerRadius
    }

    // MARK: - Configuration

    func configureWith(
        imageName: String,
        movieName: String,
        rating: String
    ) {
        movieImageView.image = UIImage(named: imageName)
        movieNameLabel.text = movieName
        ratingLabel.text = rating
    }
}

/// Pасширение MovieListCollectionViewCell
extension MovieListCollectionViewCell {
    private func configureMovieImageViewConstraints() {
        NSLayoutConstraint.activate([
            movieImageView.topAnchor.constraint(
                equalTo: contentView.topAnchor
            ),
            movieImageView.leftAnchor.constraint(
                equalTo: contentView.leftAnchor
            ),
            movieImageView.rightAnchor.constraint(
                equalTo: contentView.rightAnchor
            ),
            movieImageView.heightAnchor.constraint(
                equalToConstant: Constants.Insets.imageHeight
            )
        ])
    }

    private func configureMovieInfoStackViewConstraints() {
        NSLayoutConstraint.activate([
            movieInfoStackView.topAnchor.constraint(
                equalTo: movieImageView.bottomAnchor,
                constant: Constants.Insets.inset
            ),
            movieInfoStackView.leadingAnchor.constraint(
                equalTo: contentView.leadingAnchor
            ),
            movieInfoStackView.trailingAnchor.constraint(
                equalTo: contentView.trailingAnchor
            ),
            movieInfoStackView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor
            )
        ])
    }

    private func configureStarLabelConstraints() {
        NSLayoutConstraint.activate([
            starLabel.widthAnchor.constraint(
                equalToConstant: 20
            )
        ])
    }
}
