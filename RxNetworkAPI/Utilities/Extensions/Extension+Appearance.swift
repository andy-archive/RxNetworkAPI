//
//  Extension+Appearance.swift
//  RxNetworkAPI
//
//  Created by Taekwon Lee on 2023/11/06.
//

import UIKit

extension UINavigationController {
    func configureAppearance() {
        if #available(iOS 15.0, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithDefaultBackground()
            appearance.backgroundColor = Constants.Color.Background.main
            
            appearance.largeTitleTextAttributes = [
                .font: UIFont.boldSystemFont(ofSize: 30),
                .foregroundColor: Constants.Color.Label.main
            ]
            appearance.titleTextAttributes = [
                .font: UIFont.boldSystemFont(ofSize: 17),
                .foregroundColor: Constants.Color.Label.main
            ]
            
            navigationBar.standardAppearance = appearance
            navigationBar.compactAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
            
            navigationBar.prefersLargeTitles = true
        }
    }
}

extension UITabBarController {
    func configureAppearance() {
        if #available(iOS 15.0, *) {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.configureWithDefaultBackground()
            tabBarAppearance.backgroundColor = Constants.Color.Background.secondary
            
            tabBar.standardAppearance = tabBarAppearance
            tabBar.scrollEdgeAppearance = tabBarAppearance
            
            tabBar.tintColor = Constants.Color.Label.main
            tabBar.unselectedItemTintColor = Constants.Color.Background.main
        }
    }
}
