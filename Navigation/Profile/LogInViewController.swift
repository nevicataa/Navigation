//
//  LogInViewController.swift
//  Navigation
//
//  Created by Ekaterina on 30.08.2022.
//

//
//  LogInViewController.swift
//  Navigation
//
//  Created by Ekaterina on 30.08.2022.
//

import UIKit

//extension UIImage {
//
//    func alpha(_ value:CGFloat) -> UIImage {
//        UIGraphicsBeginImageContextWithOptions(size, false, scale)
//        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
//        let newImage = UIGraphicsGetImageFromCurrentImageContext()
//        UIGraphicsEndImageContext()
//        return newImage!
//    }
//}

//extension UIImage {
//    func withAlpha(_ a: CGFloat) -> UIImage {
//        return UIGraphicsImageRenderer(size: size, format: imageRendererFormat).image { (_) in
//            draw(in: CGRect(origin: .zero, size: size), blendMode: .normal, alpha: a)
//        }
//    }
//}
extension UIImage {

    func alpha(_ value:CGFloat) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: CGPoint.zero, blendMode: .normal, alpha: value)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
}

class LogInViewController: UIViewController {

    private let notification = NotificationCenter.default

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let contentView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())

    private var loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        let backgroundImage = UIImage(named: "blue_pixel.png")!
        let changedBackgroundImage = UIImage(named: "blue_pixel.png")!.alpha(0.5)
        button.setImage(backgroundImage, for: .normal)
        button.setImage(changedBackgroundImage, for: .selected)
        button.setImage(changedBackgroundImage, for: .disabled)
        button.setImage(changedBackgroundImage, for: .highlighted)
        button.titleLabel?.textColor = UIColor.white
        button.backgroundColor = UIColor(patternImage: backgroundImage)
        button.setTitle("Log in", for: .normal)
        //button.layer.masksToBounds = false
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(loginAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private var logoImageView: UIImageView = {
        var image = UIImageView()
        let logo = UIImage(named: "logo.png")
        image = UIImageView(image: logo)
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private lazy var loginTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.backgroundColor = .systemGray6
        textField.tintColor = .lightGray
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "Логин"
        textField.autocapitalizationType = .none
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.autocapitalizationType = .none
        textField.tintColor = .lightGray
        textField.backgroundColor = .systemGray6
        textField.isSecureTextEntry = true
        textField.placeholder = "Пароль"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private var textFieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.layer.borderWidth = 1
        stackView.clipsToBounds = true
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.cornerRadius = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loginTextField.becomeFirstResponder()
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        notification.addObserver(self,
                                               selector: #selector(didShowKeyboard),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        notification.addObserver(self,
                                               selector: #selector(didHideKeyboard),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
        notification.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    private func setupView() {
        self.view.backgroundColor = .systemBackground

        view.addSubview(scrollView)

        scrollView.addSubview(contentView)

        contentView.addSubview(logoImageView)
        contentView.addSubview(textFieldsStackView)
        contentView.addSubview(loginButton)

        textFieldsStackView.addArrangedSubview(loginTextField)
        textFieldsStackView.addArrangedSubview(passwordTextField)


        let logoImageViewContrains  = setupLogoImageView()
        let scrollViewConstraints = setupScrollView()
        let textFieldsStackViewConstraints = textFieldsStackViewConstraints()
        let loginButtonConstrains = setupLoginButton()
        let contentViewConstrains = setupContentView()

        NSLayoutConstraint.activate(
            logoImageViewContrains +
            textFieldsStackViewConstraints +
            loginButtonConstrains +
            scrollViewConstraints +
            contentViewConstrains
        )
    }

    private func setupScrollView() -> [NSLayoutConstraint] {
        let top = scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
        lead = scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
        trail = scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        bottom = scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        return[bottom, trail, lead, top]
    }

    private func setupContentView() -> [NSLayoutConstraint] {
        let topAnch = contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
        leadingAnch = contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
        trailingAnch = contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
        bottomAnch = contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        widthAnch = contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        return [topAnch, leadingAnch, trailingAnch, bottomAnch, widthAnch]
    }


    private func setupLogoImageView() -> [NSLayoutConstraint] {
        let topAnchor = logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120)
        let centerAnchor = logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        let heightAnchor = logoImageView.heightAnchor.constraint(equalToConstant: 100)
        let widthAnchor = logoImageView.widthAnchor.constraint(equalToConstant: 100)
        return([topAnchor, centerAnchor, heightAnchor, widthAnchor])
        }

    private func textFieldsStackViewConstraints() -> [NSLayoutConstraint] {
        let leftAnchor = self.textFieldsStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        let rightAnchor = self.textFieldsStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        let topAnchor = self.textFieldsStackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120)
        let heightAnchor = self.textFieldsStackView.heightAnchor.constraint(equalToConstant: 100)
        return [topAnchor, leftAnchor, rightAnchor, heightAnchor]
    }

    private func setupLoginButton() -> [NSLayoutConstraint] {
        let topAnchor = loginButton.topAnchor.constraint(equalTo: self.textFieldsStackView.bottomAnchor, constant: 16)
        let leadingAnchor = loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        let trailingAnchor = loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        let heightAnchor = loginButton.heightAnchor.constraint(equalToConstant: 50)
        let bottomAnchor = loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        return([topAnchor, leadingAnchor, heightAnchor, trailingAnchor, bottomAnchor])
        }

    @objc private func didShowKeyboard(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height + 80
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }

    @objc private func didHideKeyboard(notification: Notification) {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }

    @objc private func loginAction() {
            let profileViewController = ProfileViewController()
            profileViewController.title = "Профиль"
            self.navigationController?.pushViewController(profileViewController, animated: true)
        }
}
