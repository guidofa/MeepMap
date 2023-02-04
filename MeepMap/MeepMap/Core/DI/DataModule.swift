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
    func resolveManagers(container: Container)
    func resolveMappers(container: Container)
    func resolveRepositories(container: Container)
    func resolveUseCases(container: Container)
}

class DataModule: DataModuleProtocol {
    
    func setup(defaultContainer: Container) {
        resolveManagers(container: defaultContainer)
        resolveMappers(container: defaultContainer)
        resolveRepositories(container: defaultContainer)
        resolveUseCases(container: defaultContainer)
    }
    
    func resolveManagers(container: Container) {
        container.register(NetworkManager.self) { _ in
            let provider = MoyaProvider<MultiTarget>(stubClosure: MoyaProvider.neverStub,
                                                     callbackQueue: DispatchQueue.main,
                                                     plugins: [RestClientHelper.getLoggerPlugin()])
            
            return NetworkManagerImpl(provider: provider)
        }
    }
    
    func resolveMappers(container: Container) {
        container.register(MarkerMapper.self) { _ in
            MarkerMapperImpl()
        }
    }
    
    func resolveRepositories(container: Container) {
        container.register(BaseRepository.self) { resolver in
            BaseDataRepository(networkManager: resolver.resolve(NetworkManager.self)!)
        }
        
        container.register(MarkersRepository.self) { resolver in
            MarkersDataRepository(markerMapper: resolver.resolve(MarkerMapper.self)!,
                                  networkManager: resolver.resolve(NetworkManager.self)!)
        }
    }
    
    func resolveUseCases(container: Container) {
        container.register(GetMarkersUseCase.self) { resolver in
            GetMarkersUseCase(markersRepository: resolver.resolve(MarkersRepository.self)!)
        }
    }
    
}
