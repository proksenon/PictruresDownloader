//
//  CollecioViewCotrollerExtension.swift
//  PicturesDownloader
//
//  Created by 18579132 on 28.07.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import UIKit

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return urls.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
		let activity = ActivityIndicator(view: cell.contentView)

		activity.startActivity()
		imageProvider.loadImage(url: urls[indexPath.row], size: CGSize(width: view.frame.size.width, height: view.frame.size.width)) { (image) in
			cell.imageView.image = image
//			cell.imageView.contentMode = .scaleToFill
			cell.imageView.contentMode = .scaleAspectFit
			activity.stopActivity()
			}
		return cell
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: 300, height: 600)
	}

	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let nextVC = ImageViewController()
		nextVC.modalPresentationStyle = .fullScreen

		let screenSize = UIScreen.main.bounds
		let screenWidth = screenSize.width
		let screenHeight = screenSize.height

		imageProvider.loadImage(url: urls[indexPath.row], size: nil) { (image) in
			nextVC.image = image
		}
		self.navigationController?.pushViewController(nextVC, animated: true)
	}


}
