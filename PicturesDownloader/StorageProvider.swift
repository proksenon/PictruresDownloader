//
//  FreeStorage.swift
//  PicturesDownloader
//
//  Created by 18579132 on 23.07.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

final class StorageProvider: StorageProviderProtocol {
	let fileProvider: FileProviderProtocol = FileProvider()

	func freeStorage(urls: [String]){
		fileProvider.removeAllFiles()
		removeUserDefaults(urls: urls)
	}
	private func removeUserDefaults(urls: [String]) {
		for url in urls {
			UserDefaults.standard.removeObject(forKey: url)
			UserDefaults.standard.synchronize()
		}
	}
}
