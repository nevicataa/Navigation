//  PostViewController.swift
//  Navigation
//
//  Created by Ekaterina on 10.08.2022.

import UIKit

class PostViewController: UIViewController {
    var titlePost: String = "Anonymous"


    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    private func setupView() {
        self.view.backgroundColor = .lightGray
        self.navigationItem.title = titlePost
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(infoButtonAction))
        }

    @objc private func infoButtonAction() {
        let infoViewController = InfoViewController()
        self.present(infoViewController, animated: true, completion: nil)
    }
}

