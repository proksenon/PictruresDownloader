//
//  KeyForEncrypte.swift
//  PicturesDownloader
//
//  Created by 18579132 on 27.07.2020.
//  Copyright © 2020 18579132. All rights reserved.
//

import Foundation

class KeyForEncrypte {
	let encryption = EncriptionWork()

	func getKey()-> String? {
		if let keyForEncrypte = UserDefaults.standard.object(forKey: "KeyForEncrypte") as? String {
			print("keyLoad = \(keyForEncrypte)")
			return keyForEncrypte
		} else {
			do {
				let keyForEncrypte = try encryption.generateEncryptionKey(withPassword: "123")
				UserDefaults.standard.set(keyForEncrypte, forKey: "KeyForEncrypte")
				print("keySet = \(keyForEncrypte)")
				return(keyForEncrypte)
			} catch let error {
				print(error)
			}
		}
		return nil
	}
}
