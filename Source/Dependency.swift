//
//  Dependency.swift
//  RGDependencyInjector
//
//  Created by Ritesh Gupta on 26/06/18.
//  Copyright © 2018 Ritesh Gupta. All rights reserved.
//

import Foundation

public protocol Dependency {

	static var value: Self { get }
}
