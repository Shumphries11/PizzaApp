import UIKit

class LatestCell: UICollectionViewCell {
    static let reuseIdentifier = String(describing: LatestCell.self)
    static let nib = UINib(nibName: String(describing: LatestCell.reuseIdentifier), bundle: nil)
    
    @IBOutlet weak var latestCell: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
