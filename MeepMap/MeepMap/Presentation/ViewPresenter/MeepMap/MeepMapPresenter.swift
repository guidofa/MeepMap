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
    
    private let getMarkersUseCase: GetMarkersUseCase?
    
    init(getMarkersUseCase: GetMarkersUseCase, wireframe: Wireframe) {
        self.getMarkersUseCase = getMarkersUseCase
        super.init(wireframe: wireframe)
    }

    func getMarkers(lowerLeftLanLon: String, upperRightLatLon: String) {
        getMarkersUseCase?.execute(with: GetMarkersUseCaseParams(lowerLeftLanLon: lowerLeftLanLon,
                                                                 upperRightLatLon: upperRightLatLon))
            .subscribe(onSuccess: { [weak self] markers in
                self?.view?.updateMarkers(markers: markers)
            }, onFailure: { error in
                print(error.localizedDescription)
            }).disposed(by: disposeBag)
    }

}
