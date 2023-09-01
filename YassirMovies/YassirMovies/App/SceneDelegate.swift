//
//  SceneDelegate.swift
//  YassirMovies
//
//  Created by Mohamed El Gedawy on 01/09/2023.
//

import UIKit
import SwiftUI


class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    private var appCoordinator: AppCoordinator!
    internal var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        let navigationController = UINavigationController()
        window.rootViewController = navigationController
        appCoordinator = AppCoordinator(navigationController: navigationController)
        appCoordinator.start()
        self.window = window
        window.makeKeyAndVisible()
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}


}

