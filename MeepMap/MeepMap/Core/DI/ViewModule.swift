//
//  ViewModule.swift
//  MeepMap
//
//  Created by Guido Fabio on 2/2/23.
//

import Swinject

protocol ViewModuleProtocol {
    func setup(defaultContainer: Container)
    func resolveWireframe(container: Container)
    func resolvePresenters(container: Container)
    func resolveViewControllers(container: Container)
}

class ViewModule: ViewModuleProtocol {
    
    func setup(defaultContainer: Container) {
        self.resolveWireframe(container: defaultContainer)
        self.resolvePresenters(container: defaultContainer)
        self.resolveViewControllers(container: defaultContainer)
    }
    
    func resolveWireframe(container: Container) {
        container.register(Wireframe.self) { _ in
            WireframeImpl()
        }.inObjectScope(.container)
    }
    
    func resolvePresenters(container: Container) {
        container.register(MeepMapPresenter.self) { resolver in
            MeepMapPresenter(wireframe: resolver.resolve(Wireframe.self)!)
        }
    }
    
    func resolveViewControllers(container: Container) {
        container.register(MeepMapViewController.self) { resolver in
            let view = MeepMapViewController()
            view.presenter = resolver.resolve(MeepMapPresenter.self)!
            return view
        }
    }
}
