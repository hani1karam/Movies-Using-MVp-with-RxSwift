//
//  BaseViewProtocol.swift
//  Movies Using MVp with RxSwift
//
//  Created by Hany Karam on 9/8/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation
protocol BaseViewProtocol: class {
    func setLocalization()
    
    // Error Handling
    func showLoading()
    func hideLoading()
    func showLogin()
    func showBlockScreenWithRetry()
    func showScreenNoConnection()
    func showAlert(title: String?, message: String)
    func updateCartBadge(with value: Int)
    func checkDirectionRTL() -> Bool

}
protocol BasePresenterProtocol: class {
    func handelGloaplError(_ error: AppError, view: BaseViewProtocol?)
}
