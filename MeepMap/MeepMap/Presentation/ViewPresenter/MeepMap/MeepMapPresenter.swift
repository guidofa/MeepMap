//
//  MeepMapPresenter.swift
//  MeepMap
//
//  Created by Guido Fabio on 2/2/23.
//

import Foundation

class MeepMapPresenter: BasePresenter {
    
    // MARK: - View delegate
    internal var view: MeepMapView? {
        return baseView as? MeepMapView
    }
    
    // MARK: - Private properties
    private let getMarkersUseCase: GetMarkersUseCase?
    
    // MARK: - Init
    init(getMarkersUseCase: GetMarkersUseCase, wireframe: Wireframe) {
        self.getMarkersUseCase = getMarkersUseCase
        super.init(wireframe: wireframe)
    }

    // MARK: - Public methods
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
