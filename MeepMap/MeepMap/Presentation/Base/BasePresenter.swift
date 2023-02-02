//
//  BasePresenter.swift
//  MeepMap
//
//  Created by Guido Fabio on 2/2/23.
//

import RxSwift
import Moya

protocol BasePresenterProtocol {
    func viewDidLoad()
    func viewWillAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
    func attachView<T: BaseView>(view: T)
}

class BasePresenter: BasePresenterProtocol {
    
    internal weak var baseView: BaseView?
    internal let disposeBag: DisposeBag = DisposeBag()
    internal let wireframe: Wireframe
    
    init(wireframe: Wireframe) {
        self.wireframe = wireframe
    }
    
    func viewDidLoad() { }
    func viewWillAppear(_ animated: Bool) { }
    func viewWillDisappear(_ animated: Bool) {}
    func attachView<T: BaseView>(view: T) {
        self.baseView = view
    }
}
