import UIKit

class ImageView: UIView {

	var imageView: UIImageView = UIImageView()

	override init(frame: CGRect) {
		super.init(frame: frame)
		self.addSubview(imageView)
		setupImageViewConstraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setupImageViewConstraints() {
		imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
		imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.sizeToFit()
	}

}
