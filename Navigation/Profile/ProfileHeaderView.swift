//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Ekaterina on 17.08.2022.
//

import UIKit

class ProfileHeaderView: UIView, UITextFieldDelegate {

    private var statusText: String?

    private lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 55
        image.clipsToBounds = true
        image.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel.png")!)
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var nameLabel: UILabel = {
        let name = UILabel()
        name.text = "Username"
        name.font = UIFont(name: "Halvetica-Bold", size: 18)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()

    private lazy var statusLabel: UILabel = {
        let name = UILabel()
        name.text = "Status"
        name.font = UIFont(name: "Halvetica", size: 14)
        name.textColor = UIColor.gray
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()

    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "Halvetica", size: 15)
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "Введите текст статуса"
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = .whileEditing
        return textField
    }()

    private lazy var showButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.titleLabel?.textColor = UIColor.white
        button.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel.png")!)
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.layer.masksToBounds = false
        button.addTarget(self, action: #selector(statusButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        NSLayoutConstraint.activate(
            self.setupStatusLabel() + self.setupStatusTextField() + self.setupNameLabel() + self.setupStatusButton() + self.setupImageView())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func statusButton() {
        print(statusLabel.text ?? "Пустой заголовок")
        statusTextField.delegate = self
        statusLabel.text = statusTextField.text
    }

    private func setupStatusButton() -> [NSLayoutConstraint] {
        self.addSubview(showButton)
        let topAnchor = showButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 136)
        let leadingAnchor = showButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16)
        let trailingAnchor = showButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let heightAnchor = showButton.heightAnchor.constraint(equalToConstant: 50)
        return([topAnchor, leadingAnchor, heightAnchor, trailingAnchor])
        }

    private func setupImageView() -> [NSLayoutConstraint] {
        self.addSubview(avatarImageView)
        let topAnchor = avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 18)
        let leadingAnchor = avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14)
        let heightAnchor = avatarImageView.heightAnchor.constraint(equalToConstant: 110)
        let widthAnchor = avatarImageView.widthAnchor.constraint(equalToConstant: 110)
        return([topAnchor, leadingAnchor, heightAnchor, widthAnchor])
        }

    private func setupNameLabel() -> [NSLayoutConstraint] {
        self.addSubview(nameLabel)
        let topAnchor = nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15)
        let leadingAnchor = nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 145)
        let heightAnchor = nameLabel.heightAnchor.constraint(equalToConstant: 50)
        return([topAnchor, leadingAnchor, heightAnchor])
        }

    private func setupStatusLabel() -> [NSLayoutConstraint] {
        self.addSubview(statusLabel)
        let heightAnchor = statusLabel.heightAnchor.constraint(equalToConstant: 50)
        let leadingAnchor =  statusLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 145)
        let topAnchor = statusLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 38)
        return([topAnchor, leadingAnchor, heightAnchor])
    }

    private func setupStatusTextField() -> [NSLayoutConstraint] {
        self.addSubview(statusTextField)
        let topAnchor = statusTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 81)
        let leadingAnchor = statusTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 145)
        let trailingAnchor = statusTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        let heightAnchor = statusTextField.heightAnchor.constraint(equalToConstant: 40)
        return([topAnchor, leadingAnchor, heightAnchor, trailingAnchor])
        }
}
