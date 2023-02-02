//
//  DataModule.swift
//  MeepMap
//
//  Created by Guido Fabio on 2/2/23.
//

import Swinject
import Moya

protocol DataModuleProtocol {
    func setup(defaultContainer: Container)
    func resolveRepositories(container: Container)
    func resolveUseCases(container: Container)
}

class DataModule: DataModuleProtocol {
    
    func setup(defaultContainer: Container) {
        self.resolveRepositories(container: defaultContainer)
        self.resolveUseCases(container: defaultContainer)
    }
    
    func resolveRepositories(container: Container) {
        
    }
    
    func resolveUseCases(container: Container) {
        
    }
        
}
