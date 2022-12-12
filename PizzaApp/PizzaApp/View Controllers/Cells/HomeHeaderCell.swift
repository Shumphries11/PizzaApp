import UIKit

class HomeHeaderCell: UICollectionViewCell {
    
    @IBOutlet weak var homeHeader: UIView!
    
    static let reuseIdentifier = String(describing: HomeHeaderCell.self)
    static let nib = UINib(nibName: String(describing: HomeHeaderCell.reuseIdentifier), bundle: nil)

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
