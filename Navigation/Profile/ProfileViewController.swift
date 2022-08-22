//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Ekaterina on 10.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    private lazy var profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.view.addSubview(self.profileHeaderView)
    }

    override func viewWillLayoutSubviews() {
        self.profileHeaderView.frame = self.view.frame
    }

}
