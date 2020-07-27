import UIKit

class ImageView: UIView {

	var imageView: UIImageView = UIImageView()

	override init(frame: CGRect) {
		super.init(frame: frame)
//		imageView.contentMode = .center
		self.addSubview(imageView)
		setupImageViewConstraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setupImageViewConstraints() {
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
		imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
		imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
		imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
//		imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
//		imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
//		imageView.translatesAutoresizingMaskIntoConstraints = false
//		imageView.sizeToFit()
	}

}
