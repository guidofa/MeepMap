//
//  BaseUseCase.swift
//  MeepMap
//
//  Created by Guido Fabio on 3/2/23.
//

import Foundation

protocol BaseUseCase {
    associatedtype Params: Any
    associatedtype Response: Any
    func execute(with params: Params) -> Response
}

extension BaseUseCase where Params == Void {
    func execute() -> Response {
        return execute(with: Void())
    }
}
