import UIKit

class RecommendedHeader: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: RecommendedHeader.self)
    static let nib = UINib(nibName: String(describing: RecommendedHeader.reuseIdentifier), bundle: nil)

    @IBOutlet weak var recommendedHeader: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
