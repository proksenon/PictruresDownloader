//
//  CustomTableView.swift
//  PicturesDownloader
//
//  Created by 18579132 on 26.07.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class CustomTableView: UITableView, CustomTableViewProtocol {

	let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))

	func setTableView(viewController: ViewController) {
		//tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
		tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
		tableView.delegate = viewController.self
		tableView.dataSource = viewController.self
		tableView.tableFooterView = UIView()
		viewController.view.addSubview(tableView)
		tableView.reloadData()
		tableView.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: viewController.view.topAnchor, constant: -50),
			tableView.bottomAnchor.constraint(equalTo: viewController.view.bottomAnchor, constant: 50),
			tableView.leftAnchor.constraint(equalTo: viewController.view.leftAnchor, constant: 0),
			tableView.rightAnchor.constraint(equalTo: viewController.view.rightAnchor, constant: 0)
		])
	}
}
