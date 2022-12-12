import UIKit

class LatestHeader: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: LatestHeader.self)
    static let nib = UINib(nibName: String(describing: LatestHeader.reuseIdentifier), bundle: nil)

    @IBOutlet weak var latestHeader: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
