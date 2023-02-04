//
//  BaseDataRepository.swift
//  MeepMap
//
//  Created by Guido Fabio on 3/2/23.
//

import Foundation

class BaseDataRepository: BaseRepository {
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getNetworkManager() -> NetworkManager {
        return networkManager
    }
}
