//
//  Injectable.swift
//  RGDependencyInjector
//
//  Created by Ritesh Gupta on 14/11/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation

// `Injectable` abstracts out the requirements to inject properties
// `Injectable` is the base protocol which a class needs to implement
// If you wish to make a custom injectable protocol like `InjectableController` then simply inherit `Injectable`

public protocol InjectableInstance: class {

	// it represents a model which one wants to inject
	associatedtype Dependency

	// implement this method to return a raw intance, which will be used while injecting depedencies
	static func instance() -> Self

	// implement this method to hookup all the dependencies
	func inject(_ dependency: Dependency)
}

public extension InjectableInstance {

	// this is the api one should use to get injected instance
	// e.g. let vc = FeedViewController.injectableInstance(feedDependency)
	// where `feedDependency` represents the `Dependency` for `FeedViewController`

	static func injectableInstance(dependency: Dependency) -> Self {
		let _instance = instance()
		_instance.inject(dependency)
		return _instance
	}
}
