//
//  ErrorType.swift
//  Movies Using MVp with RxSwift
//
//  Created by Hany Karam on 9/8/20.
//  Copyright © 2020 Hany Karam. All rights reserved.
//

import Foundation
enum ErrorType {
    case noConnection           //Status code -1
    case unauthorized           //Status code 401
    case forbidden              //Status code 403
    case notFound               //Status code 404
    case conflict               //Status code 409
    case internalServerError    //Status code 500
    case unkown
}

struct AppError: Error {
    var message :String?
    var errorType : ErrorType = .unkown
    var errorCode: Int! {
        willSet {
            switch newValue {
            case -1:
                self.errorType = .noConnection
            case 401:
                self.errorType = .unauthorized
            case 403:
                self.errorType = .forbidden
            case 404:
                self.errorType = .notFound
            case 409:
                self.errorType = .conflict
            case 500:
                self.errorType = .internalServerError
            default:
                self.errorType = .unkown
            }
        }
    }
    
}
