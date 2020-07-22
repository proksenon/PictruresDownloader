import UIKit

class CustomTableViewCell: UITableViewCell {

	@IBOutlet weak var customImageView: UIImageView!

	override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
