//
//  ViewController.swift
//  BookTalk
//
//  Created by 이민아 on 2023/05/22.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    private lazy var myBookViewController: UIViewController = {
        let viewController = UINavigationController(rootViewController: MyBookViewController())
        let tabBarItem = UITabBarItem(title: "내 도서", image: UIImage(systemName: "book"), selectedImage: nil)
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    
    private lazy var debateViewController: UIViewController = {
        let viewController = UINavigationController(rootViewController: DebateViewController())
        let tabBarItem = UITabBarItem(title: "토론", image: UIImage(systemName: "bubble.left.and.exclamationmark.bubble.right"), selectedImage: nil)
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [myBookViewController, debateViewController]
    }
    
}
