
import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		images.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomTableViewCell
		cell.customImageView?.image = images[indexPath.row]
		cell.customImageView?.sizeToFit()
		return cell
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let nextVC = ImageViewController()
		nextVC.modalPresentationStyle = .fullScreen

		let screenSize = UIScreen.main.bounds
		let screenWidth = screenSize.width
		let screenHeight = screenSize.height

		imageProvider.loadImage(url: urls[indexPath.row], size: CGSize(width: screenWidth, height: screenHeight)) { (image) in
			nextVC.image = image
		}
		self.present(nextVC, animated: false)
	}
}
