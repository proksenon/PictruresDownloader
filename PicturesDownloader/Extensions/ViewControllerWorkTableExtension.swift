
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		urls.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
		let activity = ActivityIndicator(view: cell.contentView)
		activity.startActivity()
		imageProvider.loadImage(url: urls[indexPath.row], size: CGSize(width: view.frame.size.width, height: view.frame.size.width)) { (image) in
			cell.configureCell(image: image)
			activity.stopActivity()
		}
		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let nextVC = ImageViewController()
		nextVC.modalPresentationStyle = .fullScreen

		let screenSize = UIScreen.main.bounds
		let screenWidth = screenSize.width
		let screenHeight = screenSize.height

		imageProvider.loadImage(url: urls[indexPath.row], size: nil) { (image) in
			nextVC.image = image
		}
		self.present(nextVC, animated: false)
	}
}
