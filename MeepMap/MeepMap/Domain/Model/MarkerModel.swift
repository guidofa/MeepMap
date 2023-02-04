//
//  MarkerModel.swift
//  MeepMap
//
//  Created by Guido Fabio on 3/2/23.
//

import Foundation

enum MarkerType {
    case bike
    case bus
    case generic
}

struct MarkerModel {
    let id: String?
    let name: String?
    let x: Double?
    let y: Double?
    let locationType: Int?
    let companyZoneId: Int?
    let lon: Double?
    let lat: Double?
    let bikesAvailable: Int?
    let spacesAvailable: Int?
    let markerType: MarkerType
}
