//
//  TabBarViewController.swift
//  SOPKATHON36
//
//  Created by 이은지 on 5/17/25.
//

import UIKit

final class TabBarViewController: UITabBarController, UITabBarControllerDelegate {
    
    private enum TabIndex: Int {
        case matching
        case home
        case myPage
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        
        configureController()
        setupTabBarAppearance()
    }

    private func configureController() {
        let matchingViewController = tabBarNavigationController(
            unselectedImage:.userMatching,
            selectedImage: .userMatching,
            rootViewController: MatchingViewController(),
            title: "친구 매칭"
        )

        let homeViewController = tabBarNavigationController(
            unselectedImage: .home,
            selectedImage: .home,
            rootViewController: HomeViewController(),
            title: "홈"
        )

        let myPageViewController = placeholderTab(title: "마이 페이지", imageName: "mypage")

        viewControllers = [matchingViewController, homeViewController, myPageViewController]
        selectedIndex = 1
        tabBar.tintColor = .primaryLight
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let index = viewControllers?.firstIndex(of: viewController),
              let tabIndex = TabIndex(rawValue: index) else { return true }

        let disabledTabs: [TabIndex] = [.myPage]
        return !disabledTabs.contains(tabIndex)
    }

    private func setupTabBarAppearance() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .white

        let itemAppearance = UITabBarItemAppearance()
        appearance.stackedLayoutAppearance = itemAppearance

        tabBar.standardAppearance = appearance
        tabBar.scrollEdgeAppearance = appearance
    }

    private func tabBarNavigationController(
        unselectedImage: UIImage,
        selectedImage: UIImage,
        rootViewController: UIViewController,
        title: String
    ) -> UINavigationController {
        let navigation = UINavigationController(rootViewController: rootViewController)
        navigation.tabBarItem = UITabBarItem(title: title, image: unselectedImage, selectedImage: selectedImage)
        return navigation
    }
    
    private func placeholderTab(title: String, imageName: String) -> UIViewController {
        let viewController = UIViewController()
        viewController.tabBarItem = UITabBarItem(
            title: title,
            image: assetImage(name: imageName),
            selectedImage: nil
        )
        return viewController
    }
    
    private func assetImage(name: String) -> UIImage {
        return UIImage(named: name)?.withRenderingMode(.alwaysTemplate) ?? UIImage()
    }
}
