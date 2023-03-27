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

extension UIImage {
    func withAlpha(_ a: CGFloat) -> UIImage {
        return UIGraphicsImageRenderer(size: size, format: imageRendererFormat).image { (_) in
            draw(in: CGRect(origin: .zero, size: size), blendMode: .normal, alpha: a)
        }
    }
}

extension UITextField {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.masksToBounds = true
        self.layer.mask = mask
    }
}

class LogInViewController: UIViewController {

    private let notification = NotificationCenter.default

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private var loginButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 10
        let backgroundImage = UIImage(named: "blue_pixel.png")!
        let changedBackgroundImage = UIImage(named: "blue_pixel.png")!.withAlpha(0.8)
        button.setBackgroundImage(backgroundImage, for: .normal)
        button.setBackgroundImage(changedBackgroundImage, for: .selected)
        button.setBackgroundImage(changedBackgroundImage, for: .disabled)
        button.setBackgroundImage(changedBackgroundImage, for: .highlighted)
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
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 7, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.layer.borderColor = UIColor.systemGray6.cgColor
        textField.backgroundColor = .systemGray6
        textField.layer.borderWidth = 0.5
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "Логин"
        //textField.clipsToBounds = false
        textField.textColor = .black
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 7, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.layer.borderColor = UIColor.systemGray6.cgColor
        textField.layer.borderWidth = 0.5
        textField.autocapitalizationType = .none
        //textField.clipsToBounds = false
        //textField.layer.masksToBounds = false
        textField.backgroundColor = .systemGray6
        textField.isSecureTextEntry = true
        textField.placeholder = "Пароль"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    private var dividerUIView: UIView = {
        let divider = UIView()
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = UIColor.lightGray
        return divider
    }()

    private var textFieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 0.5
        stackView.backgroundColor = .systemGray4
        stackView.layer.borderWidth = 0.5
        //stackView.clipsToBounds = true
        stackView.layer.borderColor = UIColor.systemGray4.cgColor
        stackView.layer.cornerRadius = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

   override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
       self.loginTextField.roundCorners(corners: [.topRight, .topLeft], radius: 10.0)
       self.passwordTextField.roundCorners(corners: [.bottomRight, .bottomLeft], radius: 10.0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        self.setupView()
        self.setupGesture()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loginTextField.becomeFirstResponder()
    }

   override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        super.viewWillAppear(animated)
        notification.addObserver(self,
                                               selector: #selector(didShowKeyboard),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        notification.addObserver(self,
                                               selector: #selector(didHideKeyboard),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
   }

    private func setupView() {
        self.view.backgroundColor = .systemBackground

        view.addSubview(scrollView)

        scrollView.addSubview(logoImageView)
        scrollView.addSubview(textFieldsStackView)
        scrollView.addSubview(loginButton)

        textFieldsStackView.addArrangedSubview(loginTextField)
        textFieldsStackView.addArrangedSubview(passwordTextField)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            self.logoImageView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 120),
            self.logoImageView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            self.logoImageView.heightAnchor.constraint(equalToConstant: 100),
            self.logoImageView.widthAnchor.constraint(equalToConstant: 100),
            
            self.textFieldsStackView.leftAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.leftAnchor, constant: 16),
            self.textFieldsStackView.rightAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.rightAnchor, constant: -16),
            self.textFieldsStackView.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 120),
            self.loginTextField.heightAnchor.constraint(equalToConstant: 50),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            self.passwordTextField.rightAnchor.constraint(equalTo: self.textFieldsStackView.rightAnchor),
            self.loginTextField.rightAnchor.constraint(equalTo: self.textFieldsStackView.rightAnchor),            self.passwordTextField.leftAnchor.constraint(equalTo: self.textFieldsStackView.leftAnchor),
            self.loginTextField.leftAnchor.constraint(equalTo: self.textFieldsStackView.leftAnchor),
            
            self.textFieldsStackView.leftAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.leftAnchor, constant: 16),
            self.textFieldsStackView.rightAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.rightAnchor, constant: -16),
            self.textFieldsStackView.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 120),
            self.loginTextField.heightAnchor.constraint(equalToConstant: 50),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            self.passwordTextField.rightAnchor.constraint(equalTo: self.textFieldsStackView.rightAnchor),
            self.loginTextField.rightAnchor.constraint(equalTo: self.textFieldsStackView.rightAnchor),
            self.passwordTextField.leftAnchor.constraint(equalTo: self.textFieldsStackView.leftAnchor),
            self.loginTextField.leftAnchor.constraint(equalTo: self.textFieldsStackView.leftAnchor),
            
            self.textFieldsStackView.leftAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.leftAnchor, constant: 16),
            self.textFieldsStackView.rightAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.rightAnchor, constant: -16),
            self.textFieldsStackView.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 120),
            self.loginTextField.heightAnchor.constraint(equalToConstant: 50),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            self.passwordTextField.rightAnchor.constraint(equalTo: self.textFieldsStackView.rightAnchor),
            self.loginTextField.rightAnchor.constraint(equalTo: self.textFieldsStackView.rightAnchor),
            self.passwordTextField.leftAnchor.constraint(equalTo: self.textFieldsStackView.leftAnchor),
            self.loginTextField.leftAnchor.constraint(equalTo: self.textFieldsStackView.leftAnchor),
            
            self.textFieldsStackView.leftAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.leftAnchor, constant: 16),
            self.textFieldsStackView.rightAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.rightAnchor, constant: -16),
            self.textFieldsStackView.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: 120),
            self.loginTextField.heightAnchor.constraint(equalToConstant: 50),
            self.passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            self.passwordTextField.rightAnchor.constraint(equalTo: self.textFieldsStackView.rightAnchor),
            self.loginTextField.rightAnchor.constraint(equalTo: self.textFieldsStackView.rightAnchor),
            self.passwordTextField.leftAnchor.constraint(equalTo: self.textFieldsStackView.leftAnchor),
            self.loginTextField.leftAnchor.constraint(equalTo: self.textFieldsStackView.leftAnchor),
            
            self.loginButton.topAnchor.constraint(equalTo: self.textFieldsStackView.bottomAnchor, constant: 16),
            self.loginButton.leadingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            self.loginButton.trailingAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            self.loginButton.heightAnchor.constraint(equalToConstant: 50),
            self.loginButton.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor, constant: 100)
        ])
    }

    @objc private func didShowKeyboard(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height + 80
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
            let keyboardRectangle = keyboardSize
            let keyboardHeight = keyboardRectangle.height

            let loginButtonBottomPointY = self.loginButton.frame.origin.y + 50
            let keyboardOriginY = self.view.frame.height - keyboardHeight

            let offset = keyboardOriginY <= loginButtonBottomPointY
            ? loginButtonBottomPointY - keyboardOriginY + 16
            : 0

            self.scrollView.contentOffset = CGPoint(x: 0, y: offset)
        }
    }

    @objc private func didHideKeyboard(notification: Notification) {
        self.hideKeyboard()
    }

    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }

    @objc private func hideKeyboard() {
        self.view.endEditing(true)
        self.scrollView.setContentOffset(.zero, animated: true)
    }

    @objc private func loginAction() {
            let profileViewController = ProfileViewController()
            profileViewController.title = "Профиль"
            self.navigationController?.pushViewController(profileViewController, animated: true)
        }
}
