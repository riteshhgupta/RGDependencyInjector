//
//  AppDelegate.swift
//  RGDependencyInjector
//
//  Created by Ritesh Gupta on 14/11/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	let window: UIWindow = UIWindow(frame: UIScreen.main.bounds)

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

		// create the dependency
		let fruits = ["apple", "banana", "orange"]
		let dependency = ViewControllerDependency(items: fruits)

		// inject the above dependency into `injectableInstance(:)`
		let controller = ViewController.injectableInstance(dependency: dependency)

		window.rootViewController = controller
		window.makeKeyAndVisible()
		return true
	}
}

