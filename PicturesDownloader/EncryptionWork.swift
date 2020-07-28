//
//  EncryptionWork.swift
//  PicturesDownloader
//
//  Created by 18579132 on 27.07.2020.
//  Copyright © 2020 18579132. All rights reserved.
import RNCryptor
import Foundation
class EncriptionWork {

   func encryptMessage(message: Data, encryptionKey: String) throws -> Data {
//		   let messageData = message.data(using: .utf8)!
		   let cipherData = RNCryptor.encrypt(data: message, withPassword: encryptionKey)
		   return cipherData
	   }

	func decryptMessage(encryptedMessage: Data, encryptionKey: String) throws -> Data {

		   //let encryptedData = Data.init(base64Encoded: encryptedMessage)!
		   let decryptedData = try RNCryptor.decrypt(data: encryptedMessage, withPassword: encryptionKey)
//		   let decryptedString = String(data: decryptedData, encoding: .utf8)!
		   return decryptedData
	   }

	func generateEncryptionKey(withPassword password:String) throws -> String {
		let randomData = RNCryptor.randomData(ofLength: 32)
		let cipherData = RNCryptor.encrypt(data: randomData, withPassword: password)
		return cipherData.base64EncodedString()
	}
}

