import UIKit

class ViewController: UIViewController {
	let imageProvider: ImageProviderProtocol = ImageProvider()
	var images: [UIImage?] = []
	var urls: [String] = [
		"https://img2.akspic.ru/image/35185-sportkar-bmw_3_series_e30-avtomobil-sportivnyj_avtomobil-bmw-1920x1080.jpg",
		"https://fainaidea.com/wp-content/uploads/2019/06/acastro_190322_1777_apple_streaming_0003.0.jpg",
		"https://www.cruzo.net/user/images/k/ecc3ecf42c75db1ffce5d06cbe95b1e6_644.jpg",
		"https://img2.akspic.ru/image/126877-bmw_m3-bmw_3_series_e30-sportivnyj_avtomobil-klassicheskij_avtomobil-avtomobil-1920x1080.jpg",
		"https://img3.akspic.ru/image/35168-bmw_3_series_e30-bmw_3_series_e36-semejnyj_avtomobil-bmw_m3-sportkar-1920x1080.jpg",
		"https://img1.akspic.ru/image/35104-moshhnye_mashiny-bamper-avtomobil-sportivnyj_avtomobil-lichnyj_roskoshnyj_avtomobil-1920x1080.jpg",
		"https://via.placeholder.com/150"
	]
	
	var image: UIImage?

	@IBOutlet weak var tableView: UITableView!

	override func viewDidLoad() {
		//removeUserDefaults()
		super.viewDidLoad()
		imageProvider.loadImages(urls: urls, size: CGSize(width: view.frame.size.width, height: view.frame.size.width)) { (images) in
			self.images = images
			self.tableView.reloadData()
		}
		
	}

	func removeUserDefaults() {
		for url in urls {
			UserDefaults.standard.removeObject(forKey: url)
			UserDefaults.standard.synchronize()
		}
	}
}
