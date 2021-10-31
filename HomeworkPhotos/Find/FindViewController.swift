//
//  FindViewController.swift
//  HomeworkPhotos
//
//  Created by Александр Горденко on 28.10.2021.
//

import UIKit

class FindViewController: UIViewController {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Поиск"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Поиск"
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}
