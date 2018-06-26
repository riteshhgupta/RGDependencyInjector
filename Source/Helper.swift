//
//  Helper.swift
//  RGDependencyInjector
//
//  Created by Ritesh Gupta on 26/06/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation

protocol Describable {

	var typeName: String { get }
	static var typeName: String { get }
}

extension Describable {

	var typeName: String {
		return String(describing: self)
	}

	static var typeName: String {
		return String(describing: self)
	}
}

extension Describable where Self: NSObjectProtocol {

	var typeName: String {
		let _type = type(of: self)
		return String(describing: _type)
	}
}

extension NSObject: Describable {}
