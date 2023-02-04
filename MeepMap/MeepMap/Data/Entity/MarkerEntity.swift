//
//  MarkerEntity.swift
//  MeepMap
//
//  Created by Guido Fabio on 2/2/23.
//

import Foundation

struct MarkerEntity: Codable {
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
}
