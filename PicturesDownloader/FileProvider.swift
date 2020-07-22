import Foundation

class FileProvider: FileProviderProtocol {
	let defaults = UserDefaults.standard
	let fileManager = FileManager()
	let tempDirectory = NSTemporaryDirectory()
	let networkService: NetworkServiceProtocol = NetworkService()
	let imageResizer = ImageResizer()

	func checkOriginImage(url: String)->Bool {
		if let _ = defaults.object(forKey: url) as? [String:String] {return true}
		return false
	}

	func createFile(url: String, nameFile: String)->String {
		return (tempDirectory as NSString).appendingPathComponent(nameFile)
    }
	
	func writeToFile(data: Data, path: String){
		do {
			try data.write(to: URL(fileURLWithPath: path))
			print("File text.txt created at temp directory")
		} catch let error as NSError {
			print("could't create file text.txt because of error: \(error)")
		}
	}

	func checkDirectory(nameFile: String) ->Bool {
		do {
			let filesInDirectory = try fileManager.contentsOfDirectory(atPath: tempDirectory)
			for file in filesInDirectory {
				if file == nameFile{
					print("\(nameFile) found")
					return true
				}
			}
			print("File not found")
			return false
		   } catch let error as NSError {
			   print(error)
		   }
		   return false
	   }

	func readFile(nameFile: String)->Data? {
		let path = (tempDirectory as NSString).appendingPathComponent(nameFile)
		print("try to read \(nameFile) with path = \(path)")
		if let contentsOfFile = NSData(contentsOf: URL(fileURLWithPath: path)) as Data? {
			print("return data")
			return contentsOfFile
		}
		return nil
	}
}
