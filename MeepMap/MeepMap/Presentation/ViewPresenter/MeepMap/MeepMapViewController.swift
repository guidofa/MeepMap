//
//  MeepMapViewController.swift
//  MeepMap
//
//  Created by Guido Fabio on 30/1/23.
//

import UIKit
import GoogleMaps

protocol MeepMapView: AnyObject {
    func updateMarkers(markers: [MarkerModel])
}

class MeepMapViewController: BaseViewController<MeepMapPresenter> {
    
    // MARK: - Constants
    enum Constants {
        static let latitudeLisboa = 38.716671
        static let longitudeLisboa = -9.1333303
        static let initZoom: Float = 15.0
        static let busImageName = "bus"
        static let bicycleImageName = "bicycle"
    }
    
    // MARK: - Private Properties
    private var mapView: GMSMapView?
    
    // MARK: - Load view
    override func loadView() {
        super.loadView()
        self.loadNibFor(viewControllerClass: MeepMapViewController.self)
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        mapSetup()
    }
    
    // MARK: - Private methods
    private func mapSetup() {
        let camera = GMSCameraPosition.camera(withLatitude: Constants.latitudeLisboa,
                                              longitude: Constants.longitudeLisboa,
                                              zoom: Constants.initZoom)
        
        mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        mapView?.delegate = self
        
        if let mapView = mapView {
            view.addSubview(mapView)
        }
    }
    
}

// MARK: - GMSMapViewDelegate
extension MeepMapViewController: GMSMapViewDelegate {
    
    func mapView(_ mapView: GMSMapView, idleAt position: GMSCameraPosition) {
        let projection = mapView.projection.visibleRegion()
        
        let lowerLeftLanLon = String(projection.farRight.latitude) + "," + String(projection.farRight.longitude)
        let upperRightLatLon = String(projection.nearLeft.latitude) + "," + String(projection.nearLeft.longitude)
        
        presenter.getMarkers(lowerLeftLanLon: lowerLeftLanLon, upperRightLatLon: upperRightLatLon)
    }
    
}

// MARK: - MeepMapView
extension MeepMapViewController: MeepMapView {
    
    func updateMarkers(markers: [MarkerModel]) {
        for marker in markers {
            guard let longitude = marker.x, let latitude = marker.y else { return }
            
            let gmsMarker = GMSMarker(position: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
            gmsMarker.title = marker.name
            
            switch marker.markerType {
            case .bike:
                gmsMarker.icon = UIImage.init(named: Constants.bicycleImageName)
                guard let bikesAvailable = marker.bikesAvailable,
                      let spacesAvailable = marker.spacesAvailable else { return }
                
                gmsMarker.snippet = "Bikes available: \(bikesAvailable)\nSpaces available: \(spacesAvailable)"
            case .bus:
                gmsMarker.icon = UIImage.init(named: Constants.busImageName)
                
                gmsMarker.snippet = marker.id
            case .generic:
                break
            }
            
            gmsMarker.map = self.mapView
        }
    }
    
}
