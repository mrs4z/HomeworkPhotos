//
//  PhotosViewController.swift
//  HomeworkPhotos
//
//  Created by Александр Горденко on 28.10.2021.
//

import UIKit

class PhotosViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    // test identifier
    let identifier = "imagesCell"
    let models = PhotoSection.getItems()
    
    private let collectionView:  UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Фото"
        setupViews()
    }
    
    func setupViews() {
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: PhotoCell.identifier)
        collectionView.register(PhotoLineCell.self, forCellWithReuseIdentifier: PhotoLineCell.identifier)
        collectionView.register(HeaderCollection.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollection.identifier)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.collectionViewLayout = generateSectionsByModel()
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    func generateSectionsByModel() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnviroment) -> NSCollectionLayoutSection? in
            if sectionIndex < 2 {
                return self.generateSection(section: self.models[sectionIndex])
            } else {
                return self.generateSectionLine()
            }
        }
    }
    
    func generateSection(section: PhotoSection) -> NSCollectionLayoutSection {
        let sizeItem = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.93), heightDimension: .fractionalHeight(0.93))
        let item = NSCollectionLayoutItem(layoutSize: sizeItem)
        let sizeGroup = NSCollectionLayoutSize(widthDimension: .absolute(view.frame.size.width * 0.485), heightDimension: .absolute(view.frame.size.width * (0.65 * CGFloat(section.rows))))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: sizeGroup, subitem: item, count: section.rows)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 15, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .groupPaging
        let sizeHeader = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(33))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: sizeHeader, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        header.contentInsets = NSDirectionalEdgeInsets(top: 35, leading: -10, bottom: 0, trailing: 0)
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    func generateSectionLine() -> NSCollectionLayoutSection {
        let sizeItem = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(view.frame.size.width * 0.13))
        let item = NSCollectionLayoutItem(layoutSize: sizeItem)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        let sizeGroup = NSCollectionLayoutSize(widthDimension: .absolute(view.frame.size.width), heightDimension: .absolute(view.frame.size.width * 0.4))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: sizeGroup, subitems: [item])
        group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 5, trailing: -20)
        section.orthogonalScrollingBehavior = .groupPaging
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(20))
        let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        sectionHeader.contentInsets = NSDirectionalEdgeInsets(top: -15, leading: 0, bottom: 0, trailing: 0)
        sectionHeader.pinToVisibleBounds = false
        section.boundarySupplementaryItems = [sectionHeader]
        return section
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return models.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let model = models[indexPath.section]
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollection.identifier, for: indexPath) as! HeaderCollection
        header.configure(model: model)
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let model = models[indexPath.section].items[indexPath.row]
        switch model.self {
            case .simple, .users:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCell.identifier, for: indexPath) as! PhotoCell
                cell.configure(model: model)
                cell.contentView.backgroundColor = .clear
                return cell
            case .line(let model):
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoLineCell.identifier, for: indexPath) as! PhotoLineCell
                cell.configure(model: model)
                cell.contentView.backgroundColor = .clear
                return cell
        }
    }
}

