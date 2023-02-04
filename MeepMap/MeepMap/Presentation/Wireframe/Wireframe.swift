//
//  Wireframe.swift
//  MeepMap
//
//  Created by Guido Fabio on 2/2/23.
//

import SwinjectStoryboard

protocol Wireframe {
    func start()
}

final class WireframeImpl: Wireframe {
    
    // MARK: - Start App navigation
    func start() {
        guard let viewController = SwinjectStoryboard.defaultContainer.resolve(MeepMapViewController.self),
        let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Couldn't instantiate MeepMapViewController")
        }
      
        if let window = appDelegate.window {
            window.rootViewController = viewController
            window.makeKeyAndVisible()
        }
    }
    
}
