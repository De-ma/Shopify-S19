import Foundation

struct Shopify {
    let customCollections: [CustomCollection]
}

extension Shopify: Decodable {
    enum CodingKeys: String, CodingKey {
        case customCollections = "custom_collections"
    }
}

struct CustomCollection {
    let id: Int
    let handle: String
    let title: String
    let updatedAt: String
    let bodyHtml: String
    let publishedAt: String
    let sortOrder: String
    let templateSuffix: String
    let publishedScope: String
    let adminGraphQLApiId: String
    let image: Image
}

extension CustomCollection: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case handle
        case title
        case updatedAt = "updated_at"
        case bodyHtml = "body_html"
        case publishedAt = "published_at"
        case sortOrder = "sort_order"
        case templateSuffix = "template_suffix"
        case publishedScope = "published_scope"
        case adminGraphQLApiId = "admin_graphql_api_id"
        case image
    }
}

struct Image {
    let createdAt: String?
    let alt: String?
    let width: Int?
    let height: Int?
    let src: String?
}

extension Image: Decodable {
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case alt
        case width
        case height
        case src
    }
}
