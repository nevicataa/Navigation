//
//  InfoViewController.swift
//  Navigation
//
//  Created by Ekaterina on 11.08.2022.
//

import UIKit

class InfoViewController: UIViewController {

        private lazy var infoButton: UIButton = {
                let infoButton = UIButton()
            let image = UIImage(systemName: "ellipsis")
            //infoButton.backgroundColor = .blue
            //infoButton.layer.cornerRadius = 16
            infoButton.setImage(image, for: .normal)
            infoButton.addTarget(self, action: #selector(alertButtonAction), for: .touchUpInside)
            infoButton.translatesAutoresizingMaskIntoConstraints = false
                return infoButton
            }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupInfoButton()
    }

    private func setupInfoButton() {
            self.view.addSubview(self.infoButton)
            self.infoButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80).isActive = true
            self.infoButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 260).isActive = true
            self.infoButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
            self.infoButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        }

    @objc private func alertButtonAction(sender: UIButton!) {
        let alertController = UIAlertController(title: "Действия", message: "Сообщение", preferredStyle: .alert)
        let firstAction = UIAlertAction(title: "Поделиться", style: .default) { _ in
            print("1")
        }
        let secondAction = UIAlertAction(title: "Скопировать", style: .default) { _ in
            print("2")
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { _ in
            print("3")
        }
        
        alertController.addAction(firstAction)
        alertController.addAction(secondAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true)
    }
}
