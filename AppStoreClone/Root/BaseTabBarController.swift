//
//  BaseTabBarController.swift
//  AppStoreClone
//
//  Created by Jero Sanchez on 27/11/20.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers = [
            makeNavController(viewController: SearchViewController(), title: "Search", imageName: "search"),
            makeNavController(viewController: TodayViewController(), title: "Today", imageName: "today"),
            makeNavController(viewController: AppsViewController(), title: "Apps", imageName: "apps"),
        ]
    }
    
    // MARK: - Helpers
    
    private func makeNavController(viewController: UIViewController, title: String, imageName: String) -> UIViewController {

        let navController = UINavigationController(rootViewController: viewController)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: imageName)
        navController.navigationBar.prefersLargeTitles = true
        
        viewController.view.backgroundColor = .white
        viewController.navigationItem.title = title

        return navController
    }
}
