import UIKit

class DetailFooter: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: DetailFooter.self)
    static let nib = UINib(nibName: String(describing: DetailFooter.reuseIdentifier), bundle: nil)

    @IBOutlet weak var detailFooter: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
