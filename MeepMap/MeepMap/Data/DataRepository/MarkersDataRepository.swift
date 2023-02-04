//
//  MarkersDataRepository.swift
//  MeepMap
//
//  Created by Guido Fabio on 3/2/23.
//

import Moya
import RxSwift
import Foundation

class MarkersDataRepository: BaseDataRepository, MarkersRepository {
    
    // MARK: - Private properties
    private let markerMapper: MarkerMapper?
    
    // MARK: - Init
    init(markerMapper: MarkerMapper, networkManager: NetworkManager) {
        self.markerMapper = markerMapper
        super.init(networkManager: networkManager)
    }

    // MARK: - Public methods
    func getMarkersByCoordinates(lowerLeftLanLon: String, upperRightLatLon: String) -> Single<[MarkerModel]> {
        let request = MarkerRequest(lowerLeftLatLon: lowerLeftLanLon, upperRightLatLon: upperRightLatLon)
        
        return getNetworkManager().makeRequest(MarkerTarget.marker(request: request))
            .map([MarkerEntity].self)
            .flatMap({ response -> Single<[MarkerModel]> in
                return Single.just(response.compactMap { [weak self] marker in
                    self?.markerMapper?.createMarkerModel(marker: marker)
                })
            })
    }
    
}
