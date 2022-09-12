//
//  FeedViewController.swift
//  Navigation
//
//  Created by Ekaterina on 10.08.2022.
//

import UIKit

class FeedViewController: UIViewController {

    var post = Post(title: "Пост")

    private lazy var firstButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel.png")!)
        button.layer.cornerRadius = 16
        button.setTitle("Перейти на пост", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        }()

    private lazy var secondButton: UIButton = {
            let button = UIButton()
        button.backgroundColor = UIColor(patternImage: UIImage(named: "blue_pixel.png")!)
        button.layer.cornerRadius = 16
        button.setTitle("Перейти на пост", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()

    private lazy var buttonsStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupStackView()
    }
    
    private func setupStackView() {
        buttonsStackView.addArrangedSubview(firstButton)
        buttonsStackView.addArrangedSubview(secondButton)
        self.view.addSubview(buttonsStackView)

       NSLayoutConstraint.activate([
            self.secondButton.heightAnchor.constraint(equalToConstant: 50.0),
            self.secondButton.widthAnchor.constraint(equalToConstant: 200.0),
            self.firstButton.heightAnchor.constraint(equalToConstant: 50.0),
            self.firstButton.widthAnchor.constraint(equalToConstant: 200.0),
            self.buttonsStackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.buttonsStackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        }

    @objc private func buttonAction() {
            let postViewController = PostViewController()
            self.navigationController?.pushViewController(postViewController, animated: true)
            postViewController.titlePost = post.title
        }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
