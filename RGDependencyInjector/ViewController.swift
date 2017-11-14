//
//  ViewController.swift
//  RGDependencyInjector
//
//  Created by Ritesh Gupta on 14/11/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

	// dependent property which needs to be configured from outside
	var items: [String]!

	// local properties
	@IBOutlet var tableView: UITableView!
	var datasource: ViewControllerDatasource!

	override func viewDidLoad() {
		super.viewDidLoad()

		// datasource expects `items` to be non-nil
		datasource = ViewControllerDatasource(items: items)

		tableView.dataSource = datasource
		tableView.reloadData()
	}
}

extension ViewController: InjectableController {

	// it lets you define a model which represents the dependency
	typealias Dependency = ViewControllerDependency

	// these two are required to get a controller instance from a storyboard
	static var storyboardName: String { return "Main" }
	static var storyboardId: String { return "ViewController" }

	// this is where you can hookup all the dependencies/bindings
	func inject(_ dependency: ViewControllerDependency) {
		items = dependency.items
	}
}

// model which represents ViewController's dependency
struct ViewControllerDependency {

	let items: [String]
}
