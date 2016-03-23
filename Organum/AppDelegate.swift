//
//  AppDelegate.swift
//  Continuo
//
//  Created by Ben Guo on 3/22/16.
//  Copyright © 2016 othernet. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        let viewModel = MainViewModel()
        let mainVC = MainViewController(viewModel: viewModel)
        let window = UIWindow()
        window.rootViewController = mainVC;
        window.makeKeyAndVisible()
        self.window = window

        return true
    }

}

