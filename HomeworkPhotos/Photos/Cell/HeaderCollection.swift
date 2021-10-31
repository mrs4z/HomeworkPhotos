//
//  HeaderCollection.swift
//  HomeworkPhotos
//
//  Created by Александр Горденко on 29.10.2021.
//

import UIKit

class HeaderCollection: UICollectionReusableView {
    static let identifier = "HeaderCollection"
    
    private lazy var name: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private lazy var desc: UILabel = {
        let label = UILabel()
        label.textColor = .link
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("HeaderCollection error coder")
    }
    
    func setupViews() {
        addSubview(name)
        addSubview(desc)
    }
    
    override func layoutSubviews() {
        name.translatesAutoresizingMaskIntoConstraints = false
        desc.translatesAutoresizingMaskIntoConstraints = false
        name.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        name.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10).isActive = true
        desc.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        desc.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
    }
    func configure(model: PhotoSection) {
        name.text = model.name
        desc.text = model.desc
    }
}
