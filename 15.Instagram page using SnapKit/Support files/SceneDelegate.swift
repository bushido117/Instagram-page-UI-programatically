//
//  SceneDelegate.swift
//  15.Instagram page using SnapKit
//
//  Created by Вадим Сайко on 10.01.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let vc = ViewController()
        let navVc = UINavigationController(rootViewController: vc)
        window.rootViewController = navVc
        self.window = window
        window.makeKeyAndVisible()
    }
}
