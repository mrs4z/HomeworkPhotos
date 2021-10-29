//
//  PhotoCell.swift
//  HomeworkPhotos
//
//  Created by Александр Горденко on 29.10.2021.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    static let identifier = "PhotoCell"
    private var type = ""
    
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 6
        imageView.layer.masksToBounds = true
        return imageView
   }()
    
    let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    let counter: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .darkGray
        label.font = .systemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupViews()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Photo Cell error coder")
    }
    
    private func setupViews() {
        contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.addSubview(counter)
    }
    
    private func setUpImages(images: [String]) {
        if type == "users" {
            createImageUser(userImage: images[0], positionX: 0, positionY: 0)
            createImageUser(userImage: images[1], positionX: Int(contentView.frame.width) / 2, positionY: 0)
            createImageUser(userImage: images[2], positionX: 0, positionY: Int(contentView.frame.width) / 2)
            createImageUser(userImage: images[3], positionX: Int(contentView.frame.width) / 2, positionY: Int(contentView.frame.width) / 2)
        }
        
    }
    
    private func setupLayouts() {
        image.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        counter.translatesAutoresizingMaskIntoConstraints = false
        image.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        image.heightAnchor.constraint(equalTo: image.widthAnchor).isActive = true
        image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        title.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5).isActive = true
        title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        counter.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        counter.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 2).isActive = true
    }
    
    func createImageUser(userImage: String, positionX: Int, positionY: Int) {
        let image = UIImage(named: userImage)
        let imageView = UIImageView(image: image!)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = contentView.frame.width / 4
        imageView.frame = CGRect(x: positionX, y: positionY, width: Int(contentView.frame.width) / 2, height: Int(contentView.frame.width) / 2)
        contentView.addSubview(imageView)
    }
    
    func configure(model: PhotoType) {
        switch(model) {
            case .users(let model):
                type = "users"
                title.text = model.title
                counter.text = String(model.counter)
                setUpImages(images: model.images)
            case .simple(let model):
                type = "simple"
                image.image = UIImage(named: model.image)
                title.text = model.title
                counter.text = String(model.counter)
        }
    }
}
