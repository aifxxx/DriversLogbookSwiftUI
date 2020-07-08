//
//  SceneDelegate.swift
//  DriversLogbookSwiftUI
//
//  Created by Anne Feistauer on 17.06.20.
//  Copyright © 2020 Anne Feistauer. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var dataTripViewModel: DataViewModel = DataViewModel()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: TabBar()
                                                                .environmentObject(dataTripViewModel))
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}

