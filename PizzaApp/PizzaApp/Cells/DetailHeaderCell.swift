import UIKit

class DetailHeaderCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: DetailHeaderCell.self)
    static let nib = UINib(nibName: String(describing: DetailHeaderCell.reuseIdentifier), bundle: nil)
    

    @IBOutlet weak var detailHeader: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
