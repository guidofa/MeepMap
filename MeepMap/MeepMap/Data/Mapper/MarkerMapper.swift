//
//  MarkerMapper.swift
//  MeepMap
//
//  Created by Guido Fabio on 4/2/23.
//

import Foundation

protocol MarkerMapper: AnyObject {
    func createMarkerModel(marker: MarkerEntity) -> MarkerModel
}

class MarkerMapperImpl: MarkerMapper {
    
    func createMarkerModel(marker: MarkerEntity) -> MarkerModel {
        var markerType: MarkerType = .generic
        
        switch marker.companyZoneId {
        case MarkerType.bus.rawValue:
            markerType = .bus
        case MarkerType.bike.rawValue:
            markerType = .bike
        case .none, .some:
            markerType = .generic
        }
        
        return MarkerModel(id: marker.id, name: marker.name,
                           x: marker.x, y: marker.y,
                           locationType: marker.locationType, companyZoneId: marker.companyZoneId,
                           lon: marker.lon, lat: marker.lat,
                           bikesAvailable: marker.bikesAvailable, spacesAvailable: marker.spacesAvailable,
                           markerType: markerType)
    }
    
}
