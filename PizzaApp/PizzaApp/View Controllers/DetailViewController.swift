import UIKit

class DetailViewController: UIViewController {
    
    private var dataSource: UICollectionViewDiffableDataSource<Section,Item>!
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, enviornment) -> NSCollectionLayoutSection? in
            guard let self = self else {return nil}
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex].type
            
            
            switch sectionType{
            case .detailHeader: return LayoutSectionFactory.detailHeader()
            case .detailFooter: return LayoutSectionFactory.detailFooter()
            default:
                return nil
            }
        }
            
            return layout
    }()

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeDV()

    }
    
    private func initializeDV() {
        setupDVCollectionView()
        configureDVDataSource()
    }
    
    private func setupDVCollectionView() {
        let dvCells: [RegisterableView] = [
            .nib(DetailHeaderCell.self),
            .nib(DetailFooter.self)
        ]
        collectionView.register(cells: dvCells)
        collectionView.collectionViewLayout = collectionViewLayout
        self.title = "Detail"
    }
    
    private func configureDVDataSource() {
        dataSource =
        UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { [weak self]  (collectionView, indexPath, item) in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[indexPath.section].type
            
            switch sectionType {
            case .detailHeader:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailHeaderCell.reuseIdentifier, for: indexPath)
                return cell
            case .detailFooter:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailFooter.reuseIdentifier, for: indexPath)
                return cell
            
            default:
                return nil
            }
            
        }
        let sections = [
            Section(type: .detailHeader, items: [Item()]),
            Section(type: .detailFooter, items: [Item()])
        ]
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(sections)
        sections.forEach{snapshot.appendItems($0.items, toSection: $0)}
        dataSource.apply(snapshot, animatingDifferences: false)
            }

}
