import Foundation

//TODO remove the _ using codingKeys
struct Shopify {
    let customCollections: [CustomCollection]?
}

extension Shopify: Decodable {
    enum CodingKeys: String, CodingKey {
        case customCollections = "custom_collections"
    }
}

struct CustomCollection: Codable {
    var id: Int?
    var handle: String?
    var title: String?
    var updated_at: String?
    var body_html: String?
    var published_at: String?
    var sort_order: String?
    var template_suffix: String?
    var published_scope: String?
    var admin_graphql_api_id: String?
    var image: Image?
    
}

struct Image: Codable {
    var created_at: String?
    var alt: String?
    var width: Int?
    var height: Int?
    var src: String?
}
