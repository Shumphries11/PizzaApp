import UIKit

class SearchCell: UICollectionViewCell {

    @IBOutlet weak var searchCell: UIView!
    
    static let reuseIdentifier = String(describing: SearchCell.self)
    static let nib = UINib(nibName: String(describing: SearchCell.reuseIdentifier), bundle: nil)
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
