//
//  MarkerRequest.swift
//  MeepMap
//
//  Created by Guido Fabio on 3/2/23.
//

import Foundation

class MarkerRequest {
    
    var lowerLeftLatLon: String?
    var upperRightLatLon: String?
    
    init(lowerLeftLatLon: String, upperRightLatLon: String) {
        self.lowerLeftLatLon = lowerLeftLatLon
        self.upperRightLatLon = upperRightLatLon
    }
    
    func getCommonHeaders() -> [String: String] {
        var headers: [String: String] = [:]
        headers["user-Agent"] = "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36"
        headers["accept"] = "application/json"
        return headers
    }
}
