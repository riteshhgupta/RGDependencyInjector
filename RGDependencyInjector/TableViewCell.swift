//
//  TableViewCell.swift
//  RGDependencyInjector
//
//  Created by Ritesh Gupta on 14/11/17.
//  Copyright © 2017 Ritesh Gupta. All rights reserved.
//

import Foundation
import UIKit

final class TableViewCell: UITableViewCell {

	@IBOutlet var label: UILabel!

	func setLabel(text: String) { label.text = text }
}
