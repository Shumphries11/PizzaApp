import UIKit

class DetailViewController: UIViewController {
    
    private var dataSource: UICollectionViewDiffableDataSource<Section,Item>!
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, enviornment) -> NSCollectionLayoutSection? in
            guard let self = self else {return nil}
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex].type
            
            
            switch sectionType{
            case .detailHeader:
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(612))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(612))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                return section
    
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
        
        collectionView.collectionViewLayout = collectionViewLayout
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
            
            default:
                return nil
            }
            
        }
        let sections = [
            Section(type: .detailHeader, items: [Item()]),
            
        ]
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(sections)
        sections.forEach{snapshot.appendItems($0.items, toSection: $0)}
        dataSource.apply(snapshot, animatingDifferences: false)
            }

}
