import UIKit

class ImageViewController: UIViewController {
	var image: UIImage?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.restorationIdentifier = "ImageViewController"
		self.view.backgroundColor = .white
		tapImage()
    }

	override func loadView() {
		let view = FullImageView()
		view.imageView.image = image
		self.view = view
	}

	func tapImage() {
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureDone))
        self.view.addGestureRecognizer(tapGesture)
	}

	@objc func tapGestureDone(){
		self.navigationController?.popViewController(animated: true)
		//self.dismiss(animated: true, completion: nil)
	}
}
