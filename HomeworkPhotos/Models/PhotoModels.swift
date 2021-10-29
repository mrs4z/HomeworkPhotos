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
    let items: [PhotoItem]
}

struct PhotoItem {
    let title: String
    let counter: Int
    let image: String
}

extension PhotoSection {
    static func getItems() -> [PhotoSection] {
        [
            PhotoSection(name: "Мои альбомы", desc: "Все", items: [
                PhotoItem(title: "Недавние", counter: 621, image: "ImageOne"),
                PhotoItem(title: "www.s4z.io", counter: 10, image: "ImageTwo"),
                PhotoItem(title: "Телега", counter: 4, image: "ImageThree"),
                PhotoItem(title: "Мои", counter: 542, image: "ImageFour"),
                PhotoItem(title: "Whatsapp", counter: 582, image: "ImageFive"),
                PhotoItem(title: "Figma", counter: 412, image: "ImageSix"),
            ])
        ]
    }
}
