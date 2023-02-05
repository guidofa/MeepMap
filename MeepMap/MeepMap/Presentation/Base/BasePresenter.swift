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
    
    // MARK: - Public properties
    weak var baseView: BaseView?
    let disposeBag: DisposeBag = DisposeBag()
    let wireframe: Wireframe
    
    // MARK: - Init
    init(wireframe: Wireframe) {
        self.wireframe = wireframe
    }
    
    // MARK: - Life cycle
    func viewDidLoad() { }
    func viewWillAppear(_ animated: Bool) { }
    func viewWillDisappear(_ animated: Bool) {}
    func attachView<T: BaseView>(view: T) {
        self.baseView = view
    }
}
