import UIKit

class CustomTableViewCell: UITableViewCell {

	let customImageView = UIImageView()

	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
			super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubview(customImageView)
		customImageView.translatesAutoresizingMaskIntoConstraints = false
		customImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
		customImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
		customImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
		customImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
	 }

	 required init?(coder aDecoder: NSCoder) {
	   super.init(coder: aDecoder)
	}

	override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

	func configureCell(image: UIImage?) {
		addSubview(customImageView)
		customImageView.image = image
		customImageView.contentMode = .scaleToFill
	}

}
