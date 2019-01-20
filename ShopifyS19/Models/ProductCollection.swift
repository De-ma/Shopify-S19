import Foundation

struct Product: Decodable {
    let products: [ProductData]
}

struct ProductData {
    let id: Int
    let title: String
    let bodyHtml: String
    let vendor: String
    let productType: String
    let createdAt: String
    let handle: String
    let updatedAt: String
    let publishedAt : String
    let templateSuffix: String? //uhh its null
    let tags: String
    let publishedScope: String
    let adminGraphQLApiId: String
    let variants: [Variant]?
    let options: [Options]
    let images: [Images]
    let image: Images
}

extension ProductData: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case bodyHtml = "body_html"
        case vendor
        case productType = "product_type"
        case createdAt = "created_at"
        case handle
        case updatedAt = "updated_at"
        case publishedAt = "published_at"
        case templateSuffix = "template_suffix"
        case tags
        case publishedScope = "published_scope"
        case adminGraphQLApiId = "admin_graphql_api_id"
        case variants
        case options
        case images
        case image
    }
}


struct Variant {
    let id: Int
    let productId: Int
    let title: String
    let price: String?
    let sku: String
    let position: Int
    let inventoryPolicy: String
    let compareAtPrice: String? //uhh its null
    let fulfillmentService: String?
    let inventoryManagement: String? //uhh its null
    let option1: String
    let option2: String? //null
    let option3: String? //null
    let createdAt: String
    let updatedAt: String
    let taxable: Bool
    let barcode: String? //null
    let grams: Int
    let imageId: String? //null //maybe i can assume this to be a int
    let weight: Double
    let weightUnit: String
    let inventoryItemId: Int
    let inventoryQuantity: Int
    let oldInventoryQuantity: Int
    let requiresShipping: Bool
    let adminGraphQLApiId: String
}

extension Variant: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case productId = "product_id"
        case title
        case price
        case sku
        case position
        case inventoryPolicy = "inventory_policy"
        case compareAtPrice = "compare_at_price"
        case fulfillmentService = "fulfllment_service"
        case inventoryManagement = "inventory_management"
        case option1
        case option2
        case option3
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case taxable
        case barcode
        case grams
        case imageId = "image_id"
        case weight
        case weightUnit = "weight_unit"
        case inventoryItemId = "inventory_item_id"
        case inventoryQuantity = "inventory_quantity"
        case oldInventoryQuantity = "old_inventory_quantity"
        case requiresShipping = "requires_shipping"
        case adminGraphQLApiId = "admin_graphql_api_id"
    }
}

struct Options {
    let id: Int
    let productId: Int
    let name: String
    let position: Int
    let values: [String]
}

extension Options: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case productId = "product_id"
        case name
        case position
        case values
    }
}

struct Images {
    let id: Int
    let productId: Int
    let position: Int
    let createdAt: String
    let updatedAt: String
    let alt: String?
    let width: Int
    let height: Int
    let src: String
    let variantIds: [Int]?
    let adminGraphqlApiId: String
}

extension Images: Decodable {
    enum CodingKeys: String, CodingKey {
        case id
        case productId = "product_id"
        case position
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case alt
        case width
        case height
        case src
        case variantIds = "variant_ids"
        case adminGraphqlApiId = "admin_graphql_api_id"
    }
}
