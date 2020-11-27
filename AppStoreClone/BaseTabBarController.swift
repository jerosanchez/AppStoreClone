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

        let todayViewController = UIViewController()
        todayViewController.view.backgroundColor = .white
        todayViewController.navigationItem.title = "Today"
        let todayNavController = UINavigationController(rootViewController: todayViewController)
        todayNavController.tabBarItem.title = "Today"
        todayNavController.tabBarItem.image = UIImage(named: "today")
        todayNavController.navigationBar.prefersLargeTitles = true

        let appsViewController = UIViewController()
        appsViewController.view.backgroundColor = .white
        appsViewController.navigationItem.title = "Apps"
        let appsNavController = UINavigationController(rootViewController: appsViewController)
        appsNavController.tabBarItem.title = "Apps"
        appsNavController.tabBarItem.image = UIImage(named: "apps")
        appsNavController.navigationBar.prefersLargeTitles = true

        let searchViewController = UIViewController()
        searchViewController.view.backgroundColor = .white
        searchViewController.navigationItem.title = "Search"
        let searchNavController = UINavigationController(rootViewController: searchViewController)
        searchNavController.tabBarItem.title = "Search"
        searchNavController.tabBarItem.image = UIImage(named: "search")
        searchNavController.navigationBar.prefersLargeTitles = true
        

        viewControllers = [
            todayNavController,
            appsNavController,
            searchNavController,
        ]
    }
}
