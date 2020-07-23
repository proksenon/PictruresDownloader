import UIKit

class ViewController: UIViewController {
	let imageProvider: ImageProviderProtocol = ImageProvider()
	var images: [UIImage?] = []
	var urls: [String] = [
		"https://i.pinimg.com/originals/b3/c2/ff/b3c2ff8bcfad7ad8b6af0ceb99ffc7ef.jpg",
		"https://lh3.googleusercontent.com/proxy/GQTslR-3UUswzD5NxBIIj-ESa2NZjb9LzVOICBQr4ggI5pkMdD1G9cUe5IgaOZPsPxqlOL5j1nLWpl3QT4TW4YB2a8K9GriHG2b9r2i4xarH-C2YbuStAA",
		"https://img2.akspic.ru/image/35185-sportkar-bmw_3_series_e30-avtomobil-sportivnyj_avtomobil-bmw-1920x1080.jpg",
		"https://fainaidea.com/wp-content/uploads/2019/06/acastro_190322_1777_apple_streaming_0003.0.jpg",
		"https://www.cruzo.net/user/images/k/ecc3ecf42c75db1ffce5d06cbe95b1e6_644.jpg",
		"https://img2.akspic.ru/image/126877-bmw_m3-bmw_3_series_e30-sportivnyj_avtomobil-klassicheskij_avtomobil-avtomobil-1920x1080.jpg",
		"https://img3.akspic.ru/image/35168-bmw_3_series_e30-bmw_3_series_e36-semejnyj_avtomobil-bmw_m3-sportkar-1920x1080.jpg",
		"https://img1.akspic.ru/image/35104-moshhnye_mashiny-bamper-avtomobil-sportivnyj_avtomobil-lichnyj_roskoshnyj_avtomobil-1920x1080.jpg",
		"https://via.placeholder.com/150",
		"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRkiT-yyLmJNm-LFIkIuz04Wd-sOUYRrpt-bQ&usqp=CAU",
		"https://bipbap.ru/wp-content/uploads/2017/05/VOLKI-krasivye-i-ochen-umnye-zhivotnye.jpg",
		"https://lh3.googleusercontent.com/proxy/MoXxyLBSx-ZI9B-5uwYbvIXbQV-iXeTJtfoNRz5lnMZHn0r_Myzys1wsG6M7kLrgqxtg8HiaVoHoDmwqNzb2t1JXkAw44mC_2n4THYM6QArJxjEUFqewJHXu0IOk3tCOJ2mJRyWYS_UlQeV6NvP9yDqHoADG826h9LnEkutLFSb9-zAPj9F8oKuHdBVVxbC6lCnE",
		"https://lh3.googleusercontent.com/proxy/7Upy5swCitxdeiPgCSGNS8yitQL3FkAB8x2gn6fxIZF7wLjnHIG8WbU9bxTiRaFeXOWSIQew2628swn-nrXOexK48nXZvVsudoulyg_WDHjl0383aL9aipoYwxwvFECZc-RcYY4"
	]
	var image: UIImage?

	@IBOutlet weak var tableView: UITableView!

	override func viewDidLoad() {
		removeUserDefaults()
		super.viewDidLoad()
//		imageProvider.loadImages(urls: urls, size: CGSize(width: view.frame.size.width, height: view.frame.size.width)) { (images) in
//			self.images = images
//			self.tableView.reloadData()
//		}
		tableView.tableFooterView = UIView()
	}

	func removeUserDefaults() {
		for url in urls {
			UserDefaults.standard.removeObject(forKey: url)
			UserDefaults.standard.synchronize()
		}
	}
}
