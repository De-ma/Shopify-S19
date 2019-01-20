import Foundation

struct Collects: Decodable {
    let collects: [CollectData]
}

struct CollectData {
    let id: Int
    let collectionId: Int
    let productId: Int
    let featured: Bool
    let createdAt: String
    let updatedAt: String
    let position: Int
    let sortValue: String
}

extension CollectData: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case collectionId = "collection_id"
        case productId = "product_id"
        case featured
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case position
        case sortValue = "sort_value"
    }
}
