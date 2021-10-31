//
//  MediaViewController.swift
//  HomeworkPhotos
//
//  Created by Александр Горденко on 28.10.2021.
//

import UIKit

class MediaViewController: UIViewController {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Медиатека"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Медиатека"
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
