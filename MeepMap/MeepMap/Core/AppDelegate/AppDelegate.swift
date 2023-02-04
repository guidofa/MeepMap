//
//  AppDelegate.swift
//  MeepMap
//
//  Created by Guido Fabio on 30/1/23.
//

import UIKit
import GoogleMaps
import SwinjectStoryboard

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        configureGoogleMaps()
        window = UIWindow(frame: UIScreen.main.bounds)
        startNavigation()

        return true
    }
    
}

extension AppDelegate {
    
    func startNavigation() {
        guard let wireframe = SwinjectStoryboard.defaultContainer.resolve(Wireframe.self) else { return }
        wireframe.start()
        return
    }
    
    func configureGoogleMaps() {
        var keys: NSDictionary?
        
        // Geting the apiKey from keys plist. This file is going to be ignored by git.
        if let path = Bundle.main.path(forResource: "keys", ofType: "plist") {
            keys = NSDictionary(contentsOfFile: path)
        }
        
        if let dict = keys, let apiKey = dict["googleMapKey"] as? String {
            GMSServices.provideAPIKey(apiKey)
        }
    }
    
}
