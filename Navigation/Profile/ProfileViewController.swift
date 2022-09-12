//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Ekaterina on 10.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {


    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 16
        button.titleLabel?.textColor = UIColor.white
        button.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel.png")!)
        button.setTitle("Edit title", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.layer.masksToBounds = false
        button.addTarget(self, action: #selector(titleButtonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupProfileHeaderView()
        setupTitleButton()
    }

    @objc private func titleButtonAction() {
    }

    private func setupProfileHeaderView() {
        self.view.addSubview(self.profileHeaderView)

        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileHeaderView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: 220),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
        }

    private func setupTitleButton(){
        self.view.addSubview(titleButton)

        NSLayoutConstraint.activate([
            self.titleButton.heightAnchor.constraint(equalToConstant: 50),
            self.titleButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            self.titleButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            self.titleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50)
        ])
        }
}
