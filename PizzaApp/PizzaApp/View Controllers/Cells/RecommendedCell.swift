import UIKit

class RecommendedCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: RecommendedCell.self)
    static let nib = UINib(nibName: String(describing: RecommendedCell.reuseIdentifier), bundle: nil)

    @IBOutlet weak var recommendedCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
