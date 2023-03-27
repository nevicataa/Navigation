//
//  CustomTableViewCell.swift
//  Navigation
//
//  Created by Ekaterina on 21.10.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    private lazy var cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var cellTitle: UILabel = {
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 24)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    private lazy var cellLikes: UILabel = {
        let likes = UILabel()
        likes.translatesAutoresizingMaskIntoConstraints = false
        return likes
    }()

    private lazy var cellViews: UILabel = {
        let views = UILabel()
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()

    private lazy var cellDescription: UILabel = {
        let description = UILabel()
        description.textColor = .gray
        description.numberOfLines = 30
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()


    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(with viewModel: Post) {
        self.cellImageView.image = UIImage(named: "\(viewModel.image)")
        self.cellTitle.text = viewModel.author
        self.cellLikes.text = "Likes: \(viewModel.likes)"
        self.cellViews.text = "Views: \(viewModel.views)"
        self.cellDescription.text = viewModel.description
    }

    private func setupView() {
        self.addSubview(self.cellImageView)
        self.addSubview(self.cellLikes)
        self.addSubview(self.cellTitle)
        self.addSubview(self.cellViews)
        self.addSubview(self.cellDescription)

        NSLayoutConstraint.activate([
            self.cellTitle.topAnchor.constraint(equalTo: self.topAnchor),
            self.cellTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),

            self.cellImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.cellImageView.topAnchor.constraint(equalTo: cellTitle.bottomAnchor),
            self.cellImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.cellImageView.heightAnchor.constraint(equalToConstant: 150),
            self.cellImageView.widthAnchor.constraint(equalTo: self.cellImageView.heightAnchor, multiplier: 1.0),

            self.cellDescription.topAnchor.constraint(equalTo: cellImageView.bottomAnchor, constant: 10),
            self.cellDescription.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.cellDescription.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),

            self.cellLikes.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            self.cellLikes.topAnchor.constraint(equalTo: cellDescription.bottomAnchor, constant: 10),
            self.cellLikes.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            
            self.cellViews.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            self.cellViews.topAnchor.constraint(equalTo: cellDescription.bottomAnchor, constant: 10),
            self.cellViews.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
    }
}
