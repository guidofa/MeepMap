//
//  MeepMapPresenter.swift
//  MeepMap
//
//  Created by Guido Fabio on 2/2/23.
//

import Foundation

class MeepMapPresenter: BasePresenter {
    
    internal var view: MeepMapView? {
        return baseView as? MeepMapView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
