//
//  AppDelegate.swift
//  HomeworkPhotos
//
//  Created by Александр Горденко on 28.10.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let tabBar = UITabBarController()
        tabBar.setViewControllers([
            createNavController(viewController: MediaViewController(), title: "Медиатека", icon: UIImage(systemName: "photo.fill.on.rectangle.fill"), index: 0),
            createNavController(viewController: ForyouViewController(), title: "Для вас", icon: UIImage(systemName: "heart.text.square.fill"), index: 1),
            createNavController(viewController: PhotosViewController(), title: "Фото", icon: UIImage(systemName: "rectangle.stack.fill"), index: 2),
            createNavController(viewController: FindViewController(), title: "Поиск", icon: UIImage(systemName: "magnifyingglass"), index: 3),
        ], animated: true)
        
        tabBar.selectedIndex = 2
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
        return true
    }

    func createNavController(viewController: UIViewController, title: String, icon: UIImage?, index: Int) -> UINavigationController {
        let view = viewController
        let navItem = UINavigationController(rootViewController: view)
        view.tabBarItem = UITabBarItem(title: title, image: icon, tag: index)
        navItem.navigationBar.prefersLargeTitles = true
        navItem.navigationBar.isTranslucent = true
        navItem.view.backgroundColor = .white
        return navItem
    }
}

