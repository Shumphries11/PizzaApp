import UIKit

class CategoriesCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: CategoriesCell.self)
    static let nib = UINib(nibName: String(describing: CategoriesCell.reuseIdentifier), bundle: nil)

    @IBOutlet weak var categoriesCell: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
