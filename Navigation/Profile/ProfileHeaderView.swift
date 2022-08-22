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
        image.backgroundColor = .systemBlue
        image.layer.borderWidth = 3
        image.layer.borderColor = UIColor.white.cgColor
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var nameLabel: UILabel = {
        let name = UILabel(frame: CGRect(x: 150, y: 105, width: 200, height: 50))
        name.text = "Username"
        name.font = UIFont(name: "Halvetica-Bold", size: 18)
        return name
    }()

    private lazy var statusLabel: UILabel = {
        let name = UILabel(frame: CGRect(x: 150, y: 135, width: 200, height: 50))
        name.text = "Status"
        name.font = UIFont(name: "Halvetica", size: 14)
        name.textColor = UIColor.gray
        return name
    }()

    private lazy var statusTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 150, y: 185, width: 200, height: 40))
        textField.font = UIFont(name: "Halvetica", size: 15)
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "Введите текст статуса"

        textField.borderStyle = UITextField.BorderStyle.roundedRect
        //textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        textField.clearButtonMode = .whileEditing
        return textField
    }()

    private lazy var showButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.titleLabel?.textColor = UIColor.white
        button.backgroundColor = .blue
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4.0
        button.layer.masksToBounds = false
        button.addTarget(self, action: #selector(statusButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.nameLabel)
        self.addSubview(statusLabel)
        self.addSubview(statusTextField)
        setupStatusButton()
        setupImageView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func statusButton() {
        print(statusLabel.text ?? "Пустой заголовок")
        statusTextField.delegate = self
        //statusText = statusTextField.text
        statusLabel.text = statusTextField.text
    }

//    @objc private func statusTextChanged() {
//    }

    private func setupStatusButton() {
            self.addSubview(showButton)
            showButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 236).isActive = true
            showButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
            showButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
            showButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        }
    private func setupImageView() {
            self.addSubview(avatarImageView)
        avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 109).isActive = true
        avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        avatarImageView.heightAnchor.constraint(equalToConstant: 110).isActive = true
        avatarImageView.widthAnchor.constraint(equalToConstant: 110).isActive = true
        }
}
