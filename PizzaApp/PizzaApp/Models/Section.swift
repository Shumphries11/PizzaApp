import Foundation

struct Section: Hashable {
    let id = UUID()
    let type: SectionType
    let title: String
    let subtitle: String
    let items: [Item]
    
    init(type:SectionType, title: String = "", subtitle: String = "", items:[Item]) {
        self.type = type
        self.title = title
        self.subtitle = subtitle
        self.items = items
    }
    
    enum ItemSectionType: String {
        case homeHeader
        case search
        case categories
        case recommended
        case latest
        case detailHeader
        case detailFooter
    }
    
    
    
    struct SectionType: RawRepresentable, Hashable {
        typealias RawValue = String
        var rawValue: String
        
        init(rawValue: String) {
            self.rawValue = rawValue
        }
        
        static let homeHeader = SectionType(rawValue: Section.ItemSectionType.homeHeader.rawValue)
        static let search = SectionType(rawValue: Section.ItemSectionType.search.rawValue)
        static let categories = SectionType(rawValue: Section.ItemSectionType.categories.rawValue)
        static let recommended = SectionType(rawValue: Section.ItemSectionType.recommended.rawValue)
        static let latest = SectionType(rawValue: Section.ItemSectionType.latest.rawValue)
        static let detailHeader = SectionType(rawValue: Section.ItemSectionType.detailHeader.rawValue)
        static let detailFooter = SectionType(rawValue: Section.ItemSectionType.detailFooter.rawValue)
    }
    

}
