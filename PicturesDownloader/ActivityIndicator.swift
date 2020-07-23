//
//  ActivityIndicator.swift
//  PicturesDownloader
//
//  Created by 18579132 on 23.07.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

class ActivityIndicator {
    let view: UIView
	var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

    init(view: UIView) {
        self.view = view
		activityIndicator.style = .large
		activityIndicator.center = view.center
    }
	func startActivity() {
		activityIndicator.startAnimating()
		view.addSubview(activityIndicator)
	}
	func stopActivity() {
		activityIndicator.stopAnimating()
	}

}