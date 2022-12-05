import UIKit

class CategoriesHeader: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: CategoriesHeader.self)
    static let nib = UINib(nibName: String(describing: CategoriesHeader.reuseIdentifier), bundle: nil)

    @IBOutlet weak var categoriesHeader: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
