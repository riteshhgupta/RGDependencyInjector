//
//  DependencyReceivable.swift
//  RGDependencyInjector
//
//  Created by Ritesh Gupta on 26/06/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation

public protocol DependencyReceivable {

	func injectDependency<Object: Dependency>(of objectType: Object.Type) -> Object
	static func injectDependency<Object: Dependency>(of objectType: Object.Type) -> Object
}

public extension DependencyReceivable {

	func injectDependency<Object: Dependency>(of objectType: Object.Type) -> Object {
		return objectType.value
	}

	static func injectDependency<Object: Dependency>(of objectType: Object.Type) -> Object {
		return objectType.value
	}
}
