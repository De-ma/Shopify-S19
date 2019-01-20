import Foundation
import Moya

enum CollectionService {
    case getCustomCollection()
}

extension CollectionService: TargetType {
    var baseURL: URL {
        return URL(string: "https://shopicruit.myshopify.com/admin/")!
    }
    
    var path: String {
        switch self {
        case .getCustomCollection:
            return("custom_collections.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6")
        }
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
