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
        
        let mediaView = MediaViewController()
        mediaView.tabBarItem = UITabBarItem(title: "Медиатека", image: UIImage(systemName: "photo.fill.on.rectangle.fill"), tag: 0)
        let mediaNavItem = UINavigationController(rootViewController: mediaView)
        mediaNavItem.navigationBar.prefersLargeTitles = true
        mediaNavItem.navigationBar.isTranslucent = true
        mediaNavItem.view.backgroundColor = .white
        
        let foryouView = ForyouViewController()
        foryouView.tabBarItem = UITabBarItem(title: "Для вас", image: UIImage(systemName: "heart.text.square.fill"), tag: 1)
        let foryouNavItem = UINavigationController(rootViewController: foryouView)
        foryouNavItem.navigationBar.prefersLargeTitles = true
        foryouNavItem.navigationBar.isTranslucent = true
        foryouNavItem.view.backgroundColor = .white
        
        let photosView = PhotosViewController()
        photosView.tabBarItem = UITabBarItem(title: "Фото", image: UIImage(systemName: "rectangle.stack.fill"), tag: 2)
        let photosNavItem = UINavigationController(rootViewController: photosView)
        photosNavItem.navigationBar.prefersLargeTitles = true
        photosNavItem.navigationBar.isTranslucent = true
        photosNavItem.view.backgroundColor = .white
        
        let findView = FindViewController()
        findView.tabBarItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), tag: 3)
        let findNavItem = UINavigationController(rootViewController: findView)
        findNavItem.navigationBar.prefersLargeTitles = true
        findNavItem.navigationBar.isTranslucent = true
        findNavItem.view.backgroundColor = .white
        
        tabBar.setViewControllers([
            mediaNavItem,
            foryouNavItem,
            photosNavItem,
            findNavItem
        ], animated: true)
        
        tabBar.selectedIndex = 2
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
        
        return true
    }

    


}

