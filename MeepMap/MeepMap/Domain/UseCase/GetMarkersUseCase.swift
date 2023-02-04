//
//  GetMarkersUseCase.swift
//  MeepMap
//
//  Created by Guido Fabio on 3/2/23.
//

import Foundation
import RxSwift

struct GetMarkersUseCaseParams {
    let lowerLeftLanLon: String
    let upperRightLatLon: String
}

class GetMarkersUseCase: BaseUseCase {
    
    // MARK: - Typealias
    typealias Params = GetMarkersUseCaseParams
    typealias Response = Single<[MarkerModel]>
    
    // MARK: - Dependencies
    private let markersRepository: MarkersRepository
    
    // MARK: - Init
    init(markersRepository: MarkersRepository) {
        self.markersRepository = markersRepository
    }
    
    // MARK: - Implementation
    func execute(with params: GetMarkersUseCaseParams) -> Single<[MarkerModel]> {
        return markersRepository.getMarkersByCoordinates(lowerLeftLanLon: params.lowerLeftLanLon,
                                                         upperRightLatLon: params.upperRightLatLon)
    }
    
}
