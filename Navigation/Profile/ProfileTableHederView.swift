//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Ekaterina on 17.08.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {

    struct ViewModel {
        let text: String
    }

    private var statusText: String?

    private lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 55
        image.clipsToBounds = true
        image.backgroundColor = UIColor(patternImage: UIImage(named: "Felis_silvestris_silvestris.png")!)
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
        textField.layer.borderWidth = 0.5
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
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setupConstraints()
    }
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        NSLayoutConstraint.activate(
//            self.setupStatusLabel() + self.setupStatusTextField() + self.setupNameLabel() + self.setupStatusButton() + self.setupImageView())
//    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc private func statusButton() {
        print(statusLabel.text ?? "Пустой заголовок")
        //statusTextField.delegate = self
        statusLabel.text = statusTextField.text
    }

    private func setupConstraints() {
        self.addSubview(nameLabel)
        self.addSubview(statusLabel)
        self.addSubview(statusTextField)
        self.addSubview(avatarImageView)
        self.addSubview(showButton)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 145),
            nameLabel.heightAnchor.constraint(equalToConstant: 50),
            
            statusLabel.heightAnchor.constraint(equalToConstant: 50),
            statusLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 145),
            statusLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 38),
            
            statusTextField.topAnchor.constraint(equalTo: self.topAnchor, constant: 81),
            statusTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 145),
            statusTextField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 18),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            avatarImageView.heightAnchor.constraint(equalToConstant: 110),
            avatarImageView.widthAnchor.constraint(equalToConstant: 110),
            
            showButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 136),
            showButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            showButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            showButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        }

    func setup(with viewModel: ViewModel) {
        self.nameLabel.text = "Views:"
    }
}
