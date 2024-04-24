// MovieListViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран для показа списка фильмов
final class MovieListViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        enum Texts {
            static let titleLabelDescription = "Смотри исторические \nфильмы на "
            static let titleLabelCinemaName = "CINEMA STAR"
        }

        enum Insets {
            static let topInset: CGFloat = 64
            static let leading: CGFloat = 16
            static let trailing: CGFloat = -16
            static let titleHeight: CGFloat = 50
            static let inset: CGFloat = 15
        }
    }

    let movieListViewModel: MovieListViewModel?

    // MARK: - Visual Components

    private let gradientLayer = CAGradientLayer()

    private lazy var titleLabel = makeLabelWithAttributedText(
        regularText: Constants.Texts.titleLabelDescription,
        boldText: Constants.Texts.titleLabelCinemaName
    )

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(
            frame: .zero, collectionViewLayout: layout
        )
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.isScrollEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    // MARK: - Initializers

    init(movieListViewModel: MovieListViewModel?) {
        self.movieListViewModel = movieListViewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupGradientLayer()
        setupSubviews()
        configureSubviews()
        configureCollectionView()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        gradientLayer.frame = view.bounds
    }

    // MARK: - Private Methodes

    private func setupSubviews() {
        view.addSubviews([
            titleLabel,
            collectionView
        ])
    }

    private func configureSubviews() {
        configureTitleLabelConstrints()
        configureCollectionViewConstraints()
    }

    private func setupGradientLayer() {
        gradientLayer.colors = [
            UIColor.gradientTop.cgColor,
            UIColor.gradientBottom.cgColor
        ]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = view.bounds
        view.layer.addSublayer(gradientLayer)
    }

    private func configureCollectionView() {
        collectionView.register(
            MovieListCollectionViewCell.self,
            forCellWithReuseIdentifier: MovieListCollectionViewCell().identifier
        )
    }
}

// MARK: - Extensions

/// расширение MovieListViewController 
extension MovieListViewController {
    private func configureTitleLabelConstrints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: Constants.Insets.topInset
            ),
            titleLabel.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.leading
            ),
            titleLabel.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.Insets.trailing
            ),
            titleLabel.heightAnchor.constraint(
                equalToConstant: Constants.Insets.titleHeight
            )
        ])
    }

    private func configureCollectionViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(
                equalTo: titleLabel.bottomAnchor,
                constant: Constants.Insets.inset
            ),
            collectionView.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: Constants.Insets.leading
            ),
            collectionView.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: Constants.Insets.trailing
            ),
            collectionView.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
        ])
    }
}

// MARK: - MoviesListViewController + UICollectionViewDataSource

extension MovieListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MovieListCollectionViewCell().identifier,
            for: indexPath
        ) as? MovieListCollectionViewCell
        else { return UICollectionViewCell() }

        cell.configureWith(
            imageName: "movieImage",
            movieName: "MovieName",
            rating: "8.2"
        )

        return cell
    }
}

extension MovieListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        CGSize(
            width: 170,
            height: 248
        )
    }
}

// MARK: - MoviesListViewController + UICollectionViewDelegate

extension MovieListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
}
