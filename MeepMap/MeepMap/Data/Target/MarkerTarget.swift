//
//  MarkerTarget.swift
//  MeepMap
//
//  Created by Guido Fabio on 3/2/23.
//

import Moya

enum MarkerTarget {
    case marker(request: MarkerRequest)
}

extension MarkerTarget: TargetType {
    
    var baseURL: URL {
        return URL(string: NetworkManagerImpl.getBaseUrl())!
    }
    
    var path: String {
        switch self {
        case .marker:
            return "/tripplan/api/v1/routers/lisboa/resources"
        }
    }
    
    var method: Method {
        switch self {
        case .marker:
            return .get
        }
    }
    
    var headers: [String: String]? {
        var values: [String: String] = [:]
        switch self {
        case .marker(let request):
            values = request.getCommonHeaders()
        }
        return values
    }
    
    var task: Task {
        switch self {
        case let .marker(request: request):
            var urlParams: [String: Any] = [:]
            urlParams["lowerLeftLatLon"] = request.lowerLeftLatLon
            urlParams["upperRightLatLon"] = request.upperRightLatLon
            
            return .requestParameters(parameters: urlParams, encoding: URLEncoding.default)
        }
    }
    
}
