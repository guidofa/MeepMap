//
//  ApplicationModule.swift
//  MeepMap
//
//  Created by Guido Fabio on 2/2/23.
//

import SwinjectStoryboard

extension SwinjectStoryboard {
    @objc class func setup() {
        DataModule().setup(defaultContainer: defaultContainer)
        ViewModule().setup(defaultContainer: defaultContainer)
    }
}
