//
//  CustomTableView.swift
//  PicturesDownloader
//
//  Created by 18579132 on 26.07.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class CustomTableView: UITableView {

	//let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))

	func setTableView(viewController: ViewController) {
		//tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
		register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
		delegate = viewController.self
		dataSource = viewController.self
		tableFooterView = UIView()
		viewController.view.addSubview(self)
		reloadData()
		translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			topAnchor.constraint(equalTo: viewController.view.topAnchor, constant: -50),
			bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor, constant: 50),
			leftAnchor.constraint(equalTo: viewController.view.leftAnchor, constant: 0),
			rightAnchor.constraint(equalTo: viewController.view.rightAnchor, constant: 0)
		])
	}
}
