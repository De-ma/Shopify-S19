import Foundation
import Moya

enum CollectionService {
  case getCustomCollection()
  case getCollects(collectionId: Int)
  case getProducts(productIds: [Int])
}

extension CollectionService: TargetType {
  var baseURL: URL {
    switch self {
    case .getCustomCollection:
      return URL(string: "https://shopicruit.myshopify.com/admin/custom_collections.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6")!
    case let .getCollects(collectionId):
      return URL(string: "https://shopicruit.myshopify.com/admin/collects.json?collection_id=\(collectionId)&page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6")!
    case let .getProducts(productIds):
      var firstPart = "https://shopicruit.myshopify.com/admin/products.json?ids="
      let lastPart = "&page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6"
      for id in productIds {
        print("ID: \(id)")
        firstPart += "\(id),"
      }
      firstPart.remove(at: firstPart.index(before: firstPart.endIndex))
      firstPart += lastPart
      return URL(string: firstPart)!
    }
  }
  
  // for some reason dividing the URL into paths was breaking the request type..
  var path: String {
    return("")
  }
  
  var method: Moya.Method {
    return .get
  }
  
  var sampleData: Data {
    var something: Data
    something = try! JSONEncoder().encode("uh")
    return something
  }
  
  var task: Task {
    return .requestPlain
  }
  
  var headers: [String : String]? {
    return [:]
  }
}
