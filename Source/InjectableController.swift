//
//  InjectableController.swift
//  RGDependencyInjector
//
//  Created by Ritesh Gupta on 14/11/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

// `InjectableController` is a custom `Injectable` designed for storyboard controllers
// `InjectableController` should be used if one wants to inject dependency in your controllers

public protocol InjectableController: InjectableInstance {

	static var storyboardName: String { get }
	static var storyboardId: String { get }
}

// provides a default implementation which a controllers doesn't need to provide/implement
public extension InjectableController where Self: UIViewController {

	static var storyboardId: String { return typeName }

	static func instance() -> Self {
		let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
		return storyboard.instantiateViewController(withIdentifier: storyboardId) as! Self
	}
}
