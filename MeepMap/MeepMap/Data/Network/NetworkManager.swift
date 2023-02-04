//
//  NetworkManager.swift
//  MeepMap
//
//  Created by Guido Fabio on 3/2/23.
//

import Foundation
import Moya
import RxSwift

protocol NetworkManager {
    func makeRequest(_ target: TargetType) -> Single<Response>
    static func getBaseUrl() -> String
}

class NetworkManagerImpl: NetworkManager {

    // MARK: - Private properties
    private let provider: MoyaProvider<MultiTarget>
    private static var baseUrlFromConfiguration: String?
    private static var labelsUrlFromConfiguration: String?
    private static let baseUrl = "https://api.meep.me"
    
    // MARK: - Init
    init (provider: MoyaProvider<MultiTarget>) {
        self.provider = provider
    }
    
    // MARK: - Public methods
    func makeRequest(_ target: TargetType) -> Single<Response> {
        return self.provider.rx.request(MultiTarget(target))
    }
    
    static func getBaseUrl() -> String {
        return baseUrl
    }
    
}

// MARK: - Rest Client Helper
class RestClientHelper {
    
    static func getLoggerPlugin() -> PluginType {
        return NetworkLoggerPlugin(configuration: .init(formatter: .init(requestData: jsonPrettyDataFormatter,
                                                                         responseData: jsonPrettyDataFormatter),
                                                        logOptions: [.formatRequestAscURL,
                                                                     .successResponseBody,
                                                                     .errorResponseBody]))
    }
    
    static private func jsonPrettyDataFormatter(_ data: Data) -> String {
        do {
            let dataAsJSON = try JSONSerialization.jsonObject(with: data)
            let prettyData = try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
            return String(data: prettyData, encoding: .utf8) ?? String(data: data, encoding: .utf8) ?? ""
        } catch {
            return String(data: data, encoding: .utf8) ?? ""
        }
    }
    
}
