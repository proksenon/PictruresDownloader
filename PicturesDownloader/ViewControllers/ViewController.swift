import UIKit

class ViewController: UIViewController {
	let imageProvider: ImageProviderProtocol = ImageProvider()
	let fileProvider: FileProviderProtocol = FileProvider()
	let storageProvider:StorageProviderProtocol = StorageProvider()
	let defaultImage = UIImage(named: "defultImage")
	let tableView: CustomTableViewProtocol = CustomTableView()
	var urls: [String] = [
		"https://i.pinimg.com/originals/b3/c2/ff/b3c2ff8bcfad7ad8b6af0ceb99ffc7ef.jpg",
		"https://i.pinimg.com/originals/83/1d/95/831d95692a6441c47de359701bbb9933.jpg",
		"https://img2.akspic.ru/image/35185-sportkar-bmw_3_series_e30-avtomobil-sportivnyj_avtomobil-bmw-1920x1080.jpg",
		"https://fainaidea.com/wp-content/uploads/2019/06/acastro_190322_1777_apple_streaming_0003.0.jpg",
		"https://www.cruzo.net/user/images/k/ecc3ecf42c75db1ffce5d06cbe95b1e6_644.jpg",
		"https://img2.akspic.ru/image/126877-bmw_m3-bmw_3_series_e30-sportivnyj_avtomobil-klassicheskij_avtomobil-avtomobil-1920x1080.jpg",
		"https://img3.akspic.ru/image/35168-bmw_3_series_e30-bmw_3_series_e36-semejnyj_avtomobil-bmw_m3-sportkar-1920x1080.jpg",
		"https://img1.akspic.ru/image/35104-moshhnye_mashiny-bamper-avtomobil-sportivnyj_avtomobil-lichnyj_roskoshnyj_avtomobil-1920x1080.jpg",
		"https://via.placeholder.com/150",
		"https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRkiT-yyLmJNm-LFIkIuz04Wd-sOUYRrpt-bQ&usqp=CAU",
		"https://bipbap.ru/wp-content/uploads/2017/05/VOLKI-krasivye-i-ochen-umnye-zhivotnye.jpg",
		"https://www.digger.ru/storage/app/media/uploaded-files/537doublebubbleblue-414w-896h@2xiphone.jpg",
		"https://wallpapershome.ru/images/wallpapers/oboi-iphone-10-1440x2560-oboi-iphone-x-15708.jpg"
	]
	var image: UIImage?

	override func viewDidLoad() {
		storageProvider.freeStorage(urls: urls)
		super.viewDidLoad()
		view.backgroundColor = .white
		tableView.setTableView(viewController: self)
	}

}
