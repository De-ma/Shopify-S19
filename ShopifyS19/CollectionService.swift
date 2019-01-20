import Foundation
import Moya

enum CollectionService {
    case getCustomCollection()
}

extension CollectionService: TargetType {
    var baseURL: URL {
        return URL(string: "https://github.com/De-ma/Shopify-S19/blob/master")!
    }
    
    var path: String {
        switch self {
        case .getCustomCollection:
            return("/basic.json")
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
