//
//  BasePresenter.swift
//  Movies Using MVp with RxSwift
//
//  Created by Hany Karam on 9/8/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation
import RxSwift

class BasePresenter: NSObject,BasePresenterProtocol {
    var disposable: Disposable?
    var disposeBag: DisposeBag
    var requestManager: RequestManager
    override init() {
        disposeBag = DisposeBag()
        requestManager = RequestManager()
    }
    
    func handelGloaplError(_ error: AppError, view: BaseViewProtocol?) {
        
        switch error.errorType {
        case .noConnection :
            view?.showScreenNoConnection()
        case .unauthorized, .forbidden :
            view?.showLogin()
        case .internalServerError :
            view?.showBlockScreenWithRetry()
        default:
            view?.showAlert(title: nil, message: error.message ?? "")
            view?.showBlockScreenWithRetry()
        }
    }
    
    deinit {
        if self.disposable != nil {
            _ = DisposeBag(disposing: self.disposable!)
        }
        
    }
    
}

