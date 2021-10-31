//
//  PhotoLineCell.swift
//  HomeworkPhotos
//
//  Created by Александр Горденко on 29.10.2021.
//

import UIKit

class PhotoLineCell: UICollectionViewCell {
    static let identifier = "PhotoLineCell"
    
    private lazy var iconView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .link
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var title: UILabel = {
       let label = UILabel()
        label.textColor = .link
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var arrowView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var arrowIcon: UIImageView = {
        var imageView = UIImageView()
        imageView.tintColor = .systemGray
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    private lazy var counter: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("PhotoLineCell error coder")
    }
    
    func setupView() {
        contentView.addSubview(iconView)
        contentView.addSubview(title)
        contentView.addSubview(arrowView)
        contentView.addSubview(counter)
        contentView.addSubview(lineView)
        iconView.addSubview(icon)
        arrowView.addSubview(arrowIcon)
    }
    
    func setupLayout() {
        iconView.translatesAutoresizingMaskIntoConstraints = false
        icon.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        arrowView.translatesAutoresizingMaskIntoConstraints = false
        arrowIcon.translatesAutoresizingMaskIntoConstraints = false
        counter.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        iconView.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor).isActive = true
        iconView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        iconView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor).isActive = true
        iconView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor).isActive = true
        icon.widthAnchor.constraint(equalTo: iconView.widthAnchor, constant: -30).isActive = true
        icon.heightAnchor.constraint(equalTo: iconView.heightAnchor, constant: -30).isActive = true
        title.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 45).isActive = true
        arrowView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        arrowView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor).isActive = true
        arrowView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor).isActive = true
        arrowIcon.centerYAnchor.constraint(equalTo: title.centerYAnchor, constant: 0).isActive = true
        arrowIcon.trailingAnchor.constraint(equalTo: arrowView.trailingAnchor, constant: 0).isActive = true
        arrowIcon.widthAnchor.constraint(equalTo: arrowView.widthAnchor, constant: -37).isActive = true
        arrowIcon.heightAnchor.constraint(equalTo: arrowView.widthAnchor, constant: -37).isActive = true
        counter.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -50).isActive = true
        counter.centerYAnchor.constraint(equalTo: title.centerYAnchor, constant: 0).isActive = true
        lineView.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 5).isActive = true
        lineView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        lineView.leadingAnchor.constraint(equalTo: title.leadingAnchor).isActive = true
        lineView.trailingAnchor.constraint(equalTo: title.trailingAnchor, constant: contentView.frame.width).isActive = true
    }
    
    override func prepareForReuse() {
        icon.image = nil
        title.text = ""
        counter.text = ""
        arrowIcon.image = nil
    }
    
    func configure(model: PhotoLine) {
        icon.image = UIImage(systemName: model.icon, withConfiguration: UIImage.SymbolConfiguration(pointSize: 20))
        title.text = model.title
        counter.text = String(model.counter)
        arrowIcon.image = UIImage(systemName: "chevron.right")
    }
}
