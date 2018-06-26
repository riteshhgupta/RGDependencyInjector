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
	// it's nil right now and will crash if accessed before initalising
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

	// it lets you define a model which represents it's dependency
	struct Dependency {

		let items: [String]
		// let user: User
		// let fruits: [Fruit]
		// it can have anyting you want as dependency
	}

	// storyboardName is required to get a controller instance from this storyboard
	static var storyboardName: String { return "Main" }

	// this is where you can hookup all the dependencies/bindings
	func inject(_ dependency: Dependency) {
		items = dependency.items
	}
}
