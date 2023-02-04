//
//  MarkersRepository.swift
//  MeepMap
//
//  Created by Guido Fabio on 3/2/23.
//

import Moya
import RxSwift

protocol MarkersRepository {
    func getMarkersByCoordinates(lowerLeftLanLon: String, upperRightLatLon: String) -> Single<[MarkerModel]>
}
