//
//  PhotoModels.swift
//  HomeworkPhotos
//
//  Created by Александр Горденко on 28.10.2021.
//

import UIKit

struct PhotoSection {
    let name: String
    let desc: String
    let rows: Int
    let items: [PhotoType]
}

enum PhotoType {
    case simple(model: PhotoItem)
    case users(model: PhotoUser)
}

struct PhotoUser {
    let title: String
    let counter: Int
    let images: [String]
}

struct PhotoItem {
    let title: String
    let counter: Int
    let image: String
}

extension PhotoSection {
    static func getItems() -> [PhotoSection] {
        [
            PhotoSection(name: "Мои альбомы", desc: "Все", rows: 2, items: [
                PhotoType.simple(model: PhotoItem(title: "Недавние", counter: 621, image: "ImageOne")),
                PhotoType.simple(model: PhotoItem(title: "www.s4z.io", counter: 10, image: "ImageTwo")),
                PhotoType.simple(model: PhotoItem(title: "Телега", counter: 4, image: "ImageThree")),
                PhotoType.simple(model: PhotoItem(title: "Мои", counter: 542, image: "ImageFour")),
                PhotoType.simple(model: PhotoItem(title: "Whatsapp", counter: 582, image: "ImageFive")),
                PhotoType.simple(model: PhotoItem(title: "Figma", counter: 412, image: "ImageSix")),
            ]),
            PhotoSection(name: "Люди и места", desc: "Все", rows: 1, items: [
                PhotoType.users(model: PhotoUser(title: "Люди", counter: 10, images: ["User1", "User2", "User3", "User4"])),
                PhotoType.simple(model: PhotoItem(title: "Места", counter: 2905, image: "Map1")),
            ])
        ]
    }
}
