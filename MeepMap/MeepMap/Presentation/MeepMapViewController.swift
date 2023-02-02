//
//  MeepMapViewController.swift
//  MeepMap
//
//  Created by Guido Fabio on 30/1/23.
//

import UIKit
import GoogleMaps

protocol MeepMapView: AnyObject {
    
}

class MeepMapViewController: BaseViewController<MeepMapPresenter> {
    
    override func loadView() {
        super.loadView()
        self.loadNibFor(viewControllerClass: MeepMapViewController.self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: -33.86, longitude: 151.20, zoom: 6.0)
        let mapView = GMSMapView.map(withFrame: view.frame, camera: camera)
        self.view.addSubview(mapView)

        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
        marker.title = "Sydney"
        marker.snippet = "Australia"
        marker.map = mapView
    }

}

extension UIViewController {
    
    func loadNibFor<Subject>(viewControllerClass: Subject) {
        loadNib(name: String(describing: viewControllerClass))
    }
    
    func loadNib(name: String) {
        let customView = Bundle.main.loadNibNamed(name, owner: self, options: nil)?.first as? UIView
        customView?.frame = self.view.bounds
        customView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(customView!)
    }
}
