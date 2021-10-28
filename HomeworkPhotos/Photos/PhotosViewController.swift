//
//  PhotosViewController.swift
//  HomeworkPhotos
//
//  Created by Александр Горденко on 28.10.2021.
//

import UIKit

class PhotosViewController: UIViewController {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Фото"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Фото"
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
