import UIKit

class HomeViewController: UIViewController {
    
    private var dataSource: UICollectionViewDiffableDataSource<Section,Item>!
    
    lazy var collectionViewLayout: UICollectionViewLayout = {
        let layout = UICollectionViewCompositionalLayout { [weak self] (sectionIndex, enviornment) -> NSCollectionLayoutSection? in
            guard let self = self else {return nil}
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[sectionIndex].type
            
            
            switch sectionType {
            case .homeHeader: return LayoutSectionFactory.homeHeader()
            
            case .search: return LayoutSectionFactory.search()
            case .categoriesHeader: return LayoutSectionFactory.categoriesHeader()
            case .categories: return LayoutSectionFactory.categories()
            case .recommendedHeader: return LayoutSectionFactory.recommendedHeader()
            case .recommended: return LayoutSectionFactory.recommended()
            case .latestHeader: return LayoutSectionFactory.latestHeader()
            case .latest: return LayoutSectionFactory.latest()

            default:
                return nil
            }
        }
    
        return layout
    }()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialize()
        
    }
    
    private func initialize() {
        setupCollectionView()
        configureDataSource()
    }
    
    private func setupCollectionView() {
        
        let cells: [RegisterableView] = [
            .nib(HomeHeaderCell.self),
            .nib(SearchCell.self),
            .nib(CategoriesHeader.self),
            .nib(CategoriesCell.self),
            .nib(RecommendedHeader.self),
            .nib(RecommendedCell.self),
            .nib(LatestHeader.self),
            .nib(LatestCell.self)
        ]
        collectionView.delegate = self
        collectionView.register(cells: cells)
        collectionView.collectionViewLayout = collectionViewLayout
        self.title = "Home"
    }
    
    
    private func configureDataSource() {
        dataSource =
        UICollectionViewDiffableDataSource<Section, Item>(collectionView: collectionView) { [weak self]  (collectionView, indexPath, item) in
            guard let self = self else { return nil }
            
            let snapshot = self.dataSource.snapshot()
            let sectionType = snapshot.sectionIdentifiers[indexPath.section].type
            
            switch sectionType {
            case .homeHeader:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeHeaderCell.reuseIdentifier, for: indexPath)
                return cell
            case .search:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCell.reuseIdentifier, for: indexPath)
                return cell
            case .categoriesHeader:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesHeader.reuseIdentifier, for: indexPath)
                return cell
            case .categories:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesCell.reuseIdentifier, for: indexPath)
                return cell
            case .recommendedHeader:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedHeader.reuseIdentifier, for: indexPath)
                return cell
            case .recommended:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendedCell.reuseIdentifier, for: indexPath)
                return cell
            case .latestHeader:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LatestHeader.reuseIdentifier, for: indexPath)
                return cell
            case .latest:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LatestCell.reuseIdentifier, for: indexPath)
                return cell
            default:
                return nil
            }
            
        }
    
        let sections = [
            Section(type: .homeHeader, items: [Item()]),
            Section(type: .search, items: [Item()]),
            Section(type: .categoriesHeader, items: [Item()]),
            Section(type: .categories, items: [Item(),Item(),Item(),Item(),Item(),Item(),Item()]),
            Section(type: .recommendedHeader, items: [Item()]),
            Section(type: .recommended, items: [Item(),Item(),Item()]),
            Section(type: .latestHeader, items: [Item()]),
            Section(type: .latest, items: [Item(), Item(), Item()])
        ]
        
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections(sections)
        sections.forEach{snapshot.appendItems($0.items, toSection: $0)}
        dataSource.apply(snapshot, animatingDifferences: false)
        
    }

}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Detail", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
