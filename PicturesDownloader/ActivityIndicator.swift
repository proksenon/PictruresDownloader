//
//  ActivityIndicator.swift
//  PicturesDownloader
//
//  Created by 18579132 on 23.07.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

final class ActivityIndicator {
    let view: UIView
	let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()

    init(view: UIView) {
        self.view = view
		activityIndicator.style = .large
		activityIndicator.center = CGPoint(x: UIScreen.main.bounds.size.width/2, y: UIScreen.main.bounds.size.height/6)
		print(view.frame.size.width)
    }

	func startActivity() {
		activityIndicator.startAnimating()
		view.addSubview(activityIndicator)
	}
	
	func stopActivity() {
		activityIndicator.stopAnimating()
	}

}
