//
//  BaseViewController.swift
//  MeepMap
//
//  Created by Guido Fabio on 2/2/23.
//

import UIKit
import Foundation

protocol BaseView: AnyObject {
    
}

class BaseViewController<P: BasePresenter>: UIViewController, BaseView {
    
    // MARK: Section - Vars
    
    typealias Presenter = P
    var presenter: Presenter!
    
    // MARK: Section - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
        presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        presenter.viewWillDisappear(animated)
    }
}
