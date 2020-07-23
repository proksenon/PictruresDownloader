import UIKit

class ImageProvider: ImageProviderProtocol {
	let networkService: NetworkServiceProtocol
	let fileProvider: FileProviderProtocol
	let imageNameManager: ImageNameManagerProtocol
	let imageResizer: ImageResizerProtocol

	init(networkService: NetworkServiceProtocol = NetworkService(),
		 fileProvider: FileProviderProtocol = FileProvider(),
		 imageNameManager: ImageNameManagerProtocol = ImageNameManager(),
		 imageResizer: ImageResizerProtocol = ImageResizer()) {
		self.networkService = networkService
		self.fileProvider = fileProvider
		self.imageNameManager = imageNameManager
		self.imageResizer = imageResizer
	}

	func loadImage(url: String, size: CGSize?, completion: @escaping (UIImage?) -> Void) {
		if fileProvider.checkOriginImage(url: url) {
			let nameFile = imageNameManager.getNameFileImage(url: url, size: size)
			if fileProvider.checkDirectory(nameFile: nameFile) {
				if let data = fileProvider.readFile(nameFile: nameFile) {
					completion (UIImage(data: data))
				}
			} else {
				originalToSize(url: url, nameFile: nameFile, size: size) { (image) in
					completion(image)
				}
			}
		} else {
			if let currentUrl = URL(string: url) {
				networkService.getData(url: currentUrl) { (data) in
					let nameFileOrigin = self.imageNameManager.getNameFileImage(url: url, size: nil)
					let path = self.fileProvider.createFile(url: url, nameFile: nameFileOrigin)
					print(path)
					self.fileProvider.writeToFile(data: data, path: path)
					let nameFile = self.imageNameManager.getNameFileImage(url: url, size: size)
					self.originalToSize(url: url, nameFile: nameFile, size: size) { (image) in
						if let image = image {
							completion(image)
						}
					}
				}
			}
		}
	}

	func originalToSize(url: String, nameFile: String, size: CGSize?, completion: @escaping (UIImage?) -> Void) {
		if let data = fileProvider.readFile(nameFile: imageNameManager.getNameFileImage(url: url, size: nil)) {
			if let newData = imageResizer.imageToSize(nameFile: nameFile, size: size, data: data) {
				completion (UIImage(data: newData))
				let path = self.fileProvider.createFile(url: url, nameFile: nameFile)
				self.fileProvider.writeToFile(data: newData, path: path)
			} else {
				completion (UIImage(data: data))
			}
		}
	}

	func loadImages(urls:[String], size: CGSize?, completion: @escaping ([UIImage?]) -> Void) {
		var images: [UIImage?] = []
		var imagesWithUrl: [String:UIImage] = [:]
		let downloadGroup = DispatchGroup()
		
		for url in urls {
			downloadGroup.enter()
			self.loadImage(url: url, size: size) { (image) in
				imagesWithUrl[url] = image
				downloadGroup.leave()
			}
		}
		downloadGroup.notify(queue: DispatchQueue.main) {
			images = self.sortImages(imagesWithUrl: imagesWithUrl, urls: urls)
			completion(images)
		}
	}

	func sortImages(imagesWithUrl: [String: UIImage], urls: [String])->[UIImage?] {
		var images: [UIImage?] = []
		for url in urls {
			images.append(imagesWithUrl[url])
		}
		return images
	}
}
